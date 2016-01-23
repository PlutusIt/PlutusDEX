contract coin {}

contract issuer {
    address public issuerAddr;
    address public coinAddr;
    coin public pluton;

    struct Rebate {
        uint plutonRewardRate;
        uint reqieredExchangeSpeed;
        uint currentExchangeSpeedRate;
        uint lastTimestamp;
        uint baseUnitForRebate;
    }
    Rebate public rebate;

    modifier ownerCheck { if (msg.sender == issuerAddr) _ }

    /*Initial */
    function issuer(address _issuer, coin _plutonAddr) {
        issuerAddr = _issuer;
        coinAddr = _plutonAddr;
        rebate.plutonRewardRate = 3; // 3%
        rebate.baseUnitForRebate = 10;
        pluton = coin(_plutonAddr);
    }

    /* issuer functions */

    function getRebate(uint _btcAmount, string txID, address _btcSeller) ownerCheck returns(uint plutonReward) {
        rebate.currentExchangeSpeedRate =  _btcAmount / (now - rebate.lastTimestamp) / rebate.reqieredExchangeSpeed;
        rebate.plutonRewardRate = rebate.plutonRewardRate * rebate.currentExchangeSpeedRate / rebate.baseUnitForRebate;
        plutonReward = _btcAmount * rebate.plutonRewardRate;
         //  pluton.emmision(plutonReward);
        //    pluton.transfer(plutonReward, _btcSeller);
    }
    
}