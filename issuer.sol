contract coin {}

contract Issuer {
    address public issuerAddr;
    address public coinAddr;
    coin public pluton;
    uint dayBtcVolume;
    uint volumeUpdateTimestamp;

    struct Rebate {
        uint plutonRewardRate;
        uint maxPlutonRewardRate;
        uint minPlutonRewardRate;
        uint minDayVolumeForReduce;
        uint dayRebateRateChange;
        uint plutonRewardRateReduceStep;
        uint plutonRewardRateReduce;
        uint baseUnitForRebate;
        uint baseUnitForBtcVolume;
    }

    Rebate public rebate;

    modifier ownerCheck { if (msg.sender == issuerAddr) _ }

    /*Initial */
    function Issuer(address _issuer, coin _plutonAddr) {
        issuerAddr = _issuer;
        coinAddr = _plutonAddr;

        rebate.baseUnitForRebate = 1000; // accrual 0,1%
        rebate.maxPlutonRewardRate = 30; // 3%
        rebate.plutonRewardRate = rebate.maxPlutonRewardRate; // 3%
        rebate.minPlutonRewardRate = 10; // 1%
        rebate.minDayVolumeForReduce = 50; // 5 BTC
        rebate.plutonRewardRateReduce = 1; // reduce 0,1% from every 0.1 BTC
        rebate.plutonRewardRateReduceStep = 1; // reduce step 0.1 BTC
        rebate.dayRebateRateChange = 0; // Initial data
        rebate.baseUnitForBtcVolume = 10; // accrual 0,1 BTC

        dayBtcVolume = 0;
        volumeUpdateTimestamp = now;

        pluton = coin(_plutonAddr);
    }

    /* issuer functions */
    /* _lastDayBtcVolume need multiply 10 */
    function updRebateRate(uint _lastDayBtcVolume) ownerCheck returns(uint plutonRewardRate) {
        if(_lastDayBtcVolume > dayBtcVolume)
        {
            rebate.dayRebateRateChange = (_lastDayBtcVolume - dayBtcVolume) / (rebate.plutonRewardRateReduceStep * rebate.plutonRewardRateReduce * rebate.baseUnitForBtcVolume);
            if(rebate.plutonRewardRate - rebate.dayRebateRateChange <= rebate.minPlutonRewardRate) {rebate.plutonRewardRate = rebate.minPlutonRewardRate; dayBtcVolume = _lastDayBtcVolume;}
                else {rebate.plutonRewardRate = rebate.plutonRewardRate - rebate.dayRebateRateChange;  dayBtcVolume = _lastDayBtcVolume;}
        } else {
            rebate.dayRebateRateChange = (dayBtcVolume - _lastDayBtcVolume) / (rebate.plutonRewardRateReduceStep * rebate.plutonRewardRateReduce * rebate.baseUnitForBtcVolume);
            if(rebate.dayRebateRateChange + rebate.plutonRewardRate >= rebate.maxPlutonRewardRate) {rebate.plutonRewardRate = rebate.maxPlutonRewardRate;  dayBtcVolume = _lastDayBtcVolume;}
                else {rebate.plutonRewardRate = rebate.plutonRewardRate + rebate.dayRebateRateChange;  dayBtcVolume = _lastDayBtcVolume;}
        }

        return(rebate.plutonRewardRate);
    }

    function getRebate() ownerCheck returns(uint plutonReward) {
        return(rebate.plutonRewardRate);
         //   pluton.emmision(plutonReward);
        //    pluton.transfer(plutonReward, _btcSeller);
    }

}
