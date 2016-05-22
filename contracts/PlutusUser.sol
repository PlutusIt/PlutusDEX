import "owned.sol";
import "Plutons.sol";
import "PlutusDex.sol";

/**
 Contract of user of Plutus.
*/
contract PlutusUser is owned {

	Plutons plutons;
	PlutusDex plutusDex;
	//Virtual debit card ID
	bytes32 userVdcIban;
	address plutusApprovedCentralAddr;
	//TODO going to use a namereg for these addresses
	function PlutusUser(bytes32 _userVdcIban, address _plutonsAddr, address _plutusDexAddr) {
		owner = msg.sender;
		userVdcIban = _userVdcIban;
		plutons = Plutons(plutons);
		plutusDex = PlutusDex(plutusDex);
	}

  function sendTokenFromDex(address _to, uint _amount) onlyowner returns(bool result) {
        return plutons.transferFrom(owner, _to, _amount);
  }

	function offerBtcFromApp(address _trader,  uint _btcOffered) onlyowner returns(bool result) {
		return plutusDex.offerBtc( _trader, _btcOffered, userVdcIban);
	}
}
