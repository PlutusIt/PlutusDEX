//Subcurrency, based on https://github.com/ethereum/dapp-bin/blob/master/standardized_contract_apis/currency.sol, 8f6d000  on 6 Sep 2015
contract plutons {

    struct Account {
        uint balance;
        mapping ( address => uint) withdrawers;
    }

    mapping ( address => Account ) accounts;

    event CoinSent(address indexed from, uint256 value, address indexed to);

    function currency() {
        //13 million plutons
        accounts[msg.sender].balance = 13000000;
    }

    function sendCoin(uint _value, address _to) returns (bool _success) {
        if (accounts[msg.sender].balance >= _value && _value < 340282366920938463463374607431768211456) {
            accounts[msg.sender].balance -= _value;
            accounts[_to].balance += _value;
            CoinSent(msg.sender, _value, _to);
            _success = true;
        }
        else _success = false;
    }

    function sendCoinFrom(address _from, uint _value, address _to) returns (bool _success) {
        uint auth = accounts[_from].withdrawers[msg.sender];
        if (accounts[_from].balance >= _value && auth >= _value && _value < 340282366920938463463374607431768211456) {
            accounts[_from].withdrawers[msg.sender] -= _value;
            accounts[_from].balance -= _value;
            accounts[_to].balance += _value;
            CoinSent(_from, _value, _to);
            _success = true;
            _success = true;
        }
        else _success = false;
    }

    function coinBalance() constant returns (uint _r) {
        _r = accounts[msg.sender].balance;
    }

    function coinBalanceOf(address _addr) constant returns (uint _r) {
        _r = accounts[_addr].balance;
    }

    function approve(address _addr) {
        accounts[msg.sender].withdrawers[_addr] = 340282366920938463463374607431768211456;
    }

    function isApproved(address _proxy) returns (bool _r) {
        _r = (accounts[msg.sender].withdrawers[_proxy] > 0);
    }

    function approveOnce(address _addr, uint256 _maxValue) {
        accounts[msg.sender].withdrawers[_addr] += _maxValue;
    }

    function isApprovedOnceFor(address _target, address _proxy) returns (uint256 _r) {
        _r = accounts[_target].withdrawers[_proxy];
    }

    function disapprove(address _addr) {
        accounts[msg.sender].withdrawers[_addr] = 0;
    }
}
