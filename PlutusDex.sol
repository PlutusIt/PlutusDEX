contract PlutusDex {
    enum CurrencySymbol { EUR, GBP, USD }
    //Addresses of ethereum accounts that are approved to verify bitcoin transactions,
    //, verify/perform deposit of fiat to escrow account and verify/perform deposit
    //of fiat to vdc
    mapping(address => bool) approvedPlutusCentral;

    struct FiatDeposit {
        address trader;
        uint fiatDeposited;
        CurrencySymbol fiatSymbol;
        uint btcAsked;
        //From https://forum.ethereum.org/discussion/3139/store-bitcoin-address-in-smart-contract
        bytes20 btcAddress; //Public address to deposit the bitcoin too
    }

    mapping(address => FiatDeposit) fiatDeposits;

    event FiatDeposited(address trader, uint fiatDeposited, CurrencySymbol fiatSymbol, uint btcAsked, bytes20 btcAddress);

    event VdcLoaded(bytes32 userVdcIban, uint fiatAmount, CurrencySymbol fiatSymbol);

    function PlutusDex() {
        approvedPlutusCentral[msg.sender] = true;
    }

    function depositFiat(address trader, uint fiatDeposited, CurrencySymbol fiatSymbol, uint btcAsked, bytes20 btcAddress) {
        if (! approvedPlutusCentral[msg.sender]) {
            //Only approved fiat trackers can make deposit
            throw;
        }
        fiatDeposits[trader] = FiatDeposit(trader, fiatDeposited, fiatSymbol, btcAsked, btcAddress);
        //Emit event, to notify all plutus-users
        FiatDeposited(trader, fiatDeposited, fiatSymbol, btcAsked, btcAddress);
    }

    function offerBtc(address trader, uint btcOffered, bytes32 userVdcIban) {
        if (! approvedPlutusCentral[msg.sender]) {
            //Only approved btc trackers can offer bitcoin
            throw;
        }
        //TODO some Null check
        FiatDeposit deposited = fiatDeposits[trader];
        uint btcTraded;
        if (deposited.btcAsked < btcOffered) {
            btcTraded = btcOffered;
        } else {
            btcTraded = deposited.btcAsked;
        }
        uint fiatReceived = deposited.fiatDeposited * (btcTraded / btcOffered);
        deposited.btcAsked -= btcOffered;
        deposited.fiatDeposited -= fiatReceived;
        //Notify user
        VdcLoaded(userVdcIban, fiatReceived, deposited.fiatSymbol);
    }
}
