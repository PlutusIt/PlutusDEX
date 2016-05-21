import "owned.sol";
import "plutons.sol";
import "PlutusDex.sol";

/**
 Contract of user of Plutus.
*/
contract PlutusUser is owned {
	// link to token
	address plutonAddr;
	//PlutusDex address
	address plutusDexAddr;
	//Virtual debit card ID
	bytes32 userVdcIban;
	address plutusApprovedCentralAddr;

	modifier plutusCentralAddrCheck { if (msg.sender == plutusApprovedCentralAddr) _ }
	modifier plutusDexCheck { if (msg.sender == plutusDexAddr) _ }


	function PlutusUser(bytes32 _userVdcIban) {
		owner = msg.sender;
		userVdcIban = _userVdcIban;
		//Rewrite when plutons and PlutusDex smart contracts will be created
		plutusApprovedCentralAddr = 0xa;
		plutonAddr = 0xa;
		plutusDexAddr = 0xa;
	}

    function sendTokenFromDex(address _to, uint _amount) plutusDexCheck returns(bool result) {
        plutons pluton;
        pluton = plutons(plutonAddr);
        result = pluton.transferFrom(owner, _to, _amount);
        return result;
    }

	function offerBtcFromApp(address _trader,  uint _btcOffered) plutusCentralAddrCheck returns(bool result) {
		PlutusDex plutusDex;
    plutusDex = PlutusDex(plutusDexAddr);
		result = plutusDex.offerBtc( _trader, _btcOffered, userVdcIban);
		return result;
	}
}
