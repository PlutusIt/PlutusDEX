//Sample contract
contract Sample
{
	uint value;
	function Sample(uint v) {
		value = v;
	}
	function set(uint v) {
		value = v;
	}
	function get() constant returns (uint) {
		return value;
	}
}
