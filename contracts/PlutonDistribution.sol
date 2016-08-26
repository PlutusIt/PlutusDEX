import "owned.sol";

contract PlutonDistribution is owned {
  mapping ( address => uint256 ) amounts;

  function setAmount(address _account, uint256 amount) {
    amounts[_account] = amount;
  }

  function amountOf(address _account) constant returns (uint256 balance) {
    return amounts[_account];
  }

  function distributePlutons() onlyowner {
    // TODO
  }
}
