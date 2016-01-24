contract coin {}

contract issuer {
    address public issuerAddr;
    address public coinAddr;
    coin public pluton;

    struct Rebate {
        uint plutonRewardRate;
        uint plutonRewardRateReduceStep;
        uint plutonRewardRateReduce;
        uint requiredExchangeSpeed;
        uint currentExchangeSpeedRate;
        uint lastTimestamp;
        uint baseUnitForRebate;
        uint minPlutonRewardRate;
        uint currentExchangeSpeed;
    }
    Rebate public rebate;

    modifier ownerCheck { if (msg.sender == issuerAddr) _ }

    /*Initial */
    function issuer(address _issuer, coin _plutonAddr) {
        issuerAddr = _issuer;
        coinAddr = _plutonAddr;

        rebate.baseUnitForRebate = 1000; // accrual 0,1%
        rebate.plutonRewardRate = 30; // 3%
        rebate.minPlutonRewardRate = 10; // 1%

        rebate.plutonRewardRateReduce = 1; // reduce 0,1% from every plutonRewardRateReduceStep more in action more in action

        rebate.requiredExchangeSpeed = 10; // 10 BTC/sec
        rebate.plutonRewardRateReduceStep = 1; // for example: every 1 BTC/sec more in action reduce rate on plutonRewardRateReduce

        rebate.lastTimestamp = now;
        pluton = coin(_plutonAddr);
    }

    /* issuer functions */

    function getRebate(uint _btcAmount, string txID, address _btcSeller) ownerCheck returns(uint plutonReward) {
        rebate.currentExchangeSpeed =  _btcAmount / (now - rebate.lastTimestamp);
        uint reduce;
        reduce = (rebate.currentExchangeSpeed -  rebate.requiredExchangeSpeed) / rebate.plutonRewardRateReduceStep * rebate.plutonRewardRateReduce;
        if(reduce > rebate.currentExchangeSpeed) {rebate.plutonRewardRate = rebate.minPlutonRewardRate;}
        else if(rebate.currentExchangeSpeed > rebate.requiredExchangeSpeed) {
                rebate.plutonRewardRate = rebate.plutonRewardRate - reduce;}
                else {rebate.plutonRewardRate = rebate.plutonRewardRate + reduce;}

        plutonReward = _btcAmount * rebate.plutonRewardRate;
         //   pluton.emmision(plutonReward);
        //    pluton.transfer(plutonReward, _btcSeller);
    }

}
