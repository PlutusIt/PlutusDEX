// Factory "morphs" into a Pudding class.
// The reasoning is that calling load in each context
// is cumbersome.

(function() {

  var contract_data = {
    abi: [{"constant":false,"inputs":[{"name":"trader","type":"address"},{"name":"fiatDeposited","type":"uint256"},{"name":"fiatSymbol","type":"uint8"},{"name":"btcAsked","type":"uint256"},{"name":"btcAddress","type":"bytes20"}],"name":"depositFiat","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"trader","type":"address"},{"name":"btcOffered","type":"uint256"},{"name":"userVdcIban","type":"bytes32"}],"name":"offerBtc","outputs":[{"name":"result","type":"bool"}],"type":"function"},{"inputs":[],"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"trader","type":"address"},{"indexed":false,"name":"fiatDeposited","type":"uint256"},{"indexed":false,"name":"fiatSymbol","type":"PlutusDex.CurrencySymbol"},{"indexed":false,"name":"btcAsked","type":"uint256"},{"indexed":false,"name":"btcAddress","type":"bytes20"}],"name":"FiatDeposited","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"userVdcIban","type":"bytes32"},{"indexed":false,"name":"fiatAmount","type":"uint256"},{"indexed":false,"name":"fiatSymbol","type":"PlutusDex.CurrencySymbol"},{"indexed":false,"name":"btcTradingVolume","type":"uint256"}],"name":"VdcLoaded","type":"event"}],
    binary: "6060604052600160a060020a0333166000908152602081905260408120805460ff19166001179055600255610222806100386000396000f3606060405260e060020a6000350463a673e81d8114610026578063ed80577d1461005f575b005b610024600435602435604435606435608435600160a060020a03331660009081526020819052604090205460ff1615156100a257610002565b610098600435602435604435600160a060020a03331660009081526020819052604081205481908190819060ff16151561017757610002565b6060908152602090f35b61010060408181526060879052608086905260a085815260c085905260e0849052600160a060020a038816600081815260016020819052939020805473ffffffffffffffffffffffffffffffffffffffff199081168b17825593810189905560028101805460ff1916891790556003810187905560040180549093166c010000000000000000000000008604179092559082526101208690526101408590526101608490526101808390527fb381da80508e7a8c6bae91ec57c281616be06e46b00dcc005a6be5fbaf45e5b491a15050505050565b600160a060020a03871681526001602052604081206003810154909350869010156101a4578591506101ac565b600383015491505b5060038201805460018401805491849003909255868304810290819003909155600280548301808255908401546060878152608084815260ff9290921660a05260c0929092527f78293d06810c9d9e6cb7a15bd0e585b7183688dddb81acf9f500d7357a08bcec91a1506001969550505050505056",
    unlinked_binary: "6060604052600160a060020a0333166000908152602081905260408120805460ff19166001179055600255610222806100386000396000f3606060405260e060020a6000350463a673e81d8114610026578063ed80577d1461005f575b005b610024600435602435604435606435608435600160a060020a03331660009081526020819052604090205460ff1615156100a257610002565b610098600435602435604435600160a060020a03331660009081526020819052604081205481908190819060ff16151561017757610002565b6060908152602090f35b61010060408181526060879052608086905260a085815260c085905260e0849052600160a060020a038816600081815260016020819052939020805473ffffffffffffffffffffffffffffffffffffffff199081168b17825593810189905560028101805460ff1916891790556003810187905560040180549093166c010000000000000000000000008604179092559082526101208690526101408590526101608490526101808390527fb381da80508e7a8c6bae91ec57c281616be06e46b00dcc005a6be5fbaf45e5b491a15050505050565b600160a060020a03871681526001602052604081206003810154909350869010156101a4578591506101ac565b600383015491505b5060038201805460018401805491849003909255868304810290819003909155600280548301808255908401546060878152608084815260ff9290921660a05260c0929092527f78293d06810c9d9e6cb7a15bd0e585b7183688dddb81acf9f500d7357a08bcec91a1506001969550505050505056",
    address: "",
    generated_with: "2.0.9",
    contract_name: "PlutusDex"
  };

  function Contract() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusDex error: Please call load() first before creating new instance of this contract.");
    }

    Contract.Pudding.apply(this, arguments);
  };

  Contract.load = function(Pudding) {
    Contract.Pudding = Pudding;

    Pudding.whisk(contract_data, Contract);

    // Return itself for backwards compatibility.
    return Contract;
  }

  Contract.new = function() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusDex error: Please call load() first before calling new().");
    }

    return Contract.Pudding.new.apply(Contract, arguments);
  };

  Contract.at = function() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusDex error: Please call load() first before calling at().");
    }

    return Contract.Pudding.at.apply(Contract, arguments);
  };

  Contract.deployed = function() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusDex error: Please call load() first before calling deployed().");
    }

    return Contract.Pudding.deployed.apply(Contract, arguments);
  };

  if (typeof module != "undefined" && typeof module.exports != "undefined") {
    module.exports = Contract;
  } else {
    // There will only be one version of Pudding in the browser,
    // and we can use that.
    window.PlutusDex = Contract;
  }

})();
