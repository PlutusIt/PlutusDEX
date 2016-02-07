contract PlutusDex {
    enum CurrencySymbol { EUR, GBP, USD }
    //Addresses of ethereum accounts that are approved to verify bitcoin transactions
    mapping(address => bool) approvedBtcTracker;
    //Addresses of ethereum accounts that are approved to verify fiat deposits
    mapping(address => bool) approvedFiatTracker;

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
        approvedBtcTracker[msg.sender] = true;
        approvedFiatTracker[msg.sender] = true;
    }

    function depositFiat(address trader, uint fiatDeposited, CurrencySymbol fiatSymbol, uint btcAsked, bytes20 btcAddress) {
        if (! approvedFiatTracker[msg.sender]) {
            //Only approved fiat trackers can make deposit
            throw;
        }
        fiatDeposits[trader] = FiatDeposit(trader, fiatDeposited, fiatSymbol, btcAsked, btcAddress);
        //Emit event, to notify all plutus-users
        FiatDeposited(trader, fiatDeposited, fiatSymbol, btcAsked, btcAddress);
    }

    function offerBtc(address trader, uint btcOffered, bytes32 userVdcIban) {
        if (! approvedBtcTracker[msg.sender]) {
            //Only approved btc trackers can offer bitcoin
            throw;
        }
        //TODO some Null check
        FiatDeposit deposited = fiatDeposits[trader];
        uint btcTraded;
        if (deposited.btcAsked < btcOffered) {
            btcTraded = btcOffered;
        } else {
            btcOffered = deposited.btcAsked;
        }
        uint fiatReceived = deposited.fiatDeposited * (btcTraded / btcOffered);
        deposited.btcAsked -= btcOffered;
        deposited.fiatDeposited -= fiatReceived;
        VdcLoaded(userVdcIban, fiatReceived, deposited.fiatSymbol);
    }
}
