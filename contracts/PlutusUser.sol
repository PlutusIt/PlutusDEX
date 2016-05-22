import "owned.sol";
import "Plutons.sol";
import "PlutusDex.sol";
import "NameReg.sol";

/**
 Contract of user of Plutus.
*/
contract PlutusUser is owned {
	//TODO conform to std contract if any
	NameReg namereg;
	//Virtual debit card ID
	bytes32 userVdcIban;
	address plutusApprovedCentralAddr;
	function PlutusUser(bytes32 _userVdcIban, NameReg _namereg) {
		owner = msg.sender;
		userVdcIban = _userVdcIban;
		namereg = _namereg;
	}

  function sendTokenFromDex(address _to, uint _amount) onlyowner returns(bool result) {
  		Plutons plutons = Plutons(namereg.addr('Plutons'));
        return plutons.transferFrom(owner, _to, _amount);
  }

	function offerBtcFromApp(address _trader,  uint _btcOffered) onlyowner returns(bool result) {
		PlutusDex plutusDex = PlutusDex(namereg.addr('PlutusDex'));
		return plutusDex.offerBtc( _trader, _btcOffered, userVdcIban);
	}
}
