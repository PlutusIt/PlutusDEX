// Factory "morphs" into a Pudding class.
// The reasoning is that calling load in each context
// is cumbersome.

(function() {

  var contract_data = {
    abi: [{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_amount","type":"uint256"}],"name":"sendTokenFromDex","outputs":[{"name":"result","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"_trader","type":"address"},{"name":"_btcOffered","type":"uint256"}],"name":"offerBtcFromApp","outputs":[{"name":"result","type":"bool"}],"type":"function"},{"inputs":[{"name":"_userVdcIban","type":"bytes32"},{"name":"_namereg","type":"address"}],"type":"constructor"}],
    binary: "60606040818152806102ac833960a09052516080516000805433600160a060020a0319918216811782161782556002939093556001805490931690911790915561025e90819061004e90396000f3606060405260e060020a600035046317bf8f50811461002657806390f551ec14610138575b005b61024c60043560243560008054819033600160a060020a03908116911614156101315760015460e060020a63511b1df90260609081526020606481815260076084527f506c75746f6e730000000000000000000000000000000000000000000000000060a452600160a060020a03939093169263511b1df99260c492918187876161da5a03f11561000257505060408051805193547f23b872dd000000000000000000000000000000000000000000000000000000008252600160a060020a039081166004830152808816602483015260448201879052915191841692506323b872dd916064828101926020929190829003018188876161da5a03f115610002575050604051519250505b5092915050565b61024c60043560243560008054819033600160a060020a03908116911614156101315760015460e060020a63511b1df90260609081526020606481815260096084527f506c75747573446578000000000000000000000000000000000000000000000060a452600160a060020a03939093169263511b1df99260c492918187876161da5a03f1156100025750506040805180516002547fed80577d000000000000000000000000000000000000000000000000000000008352600160a060020a03808a1660048501526024840189905260448401919091529251909450918416925063ed80577d916064828101926020929190829003018188876161da5a03f1156100025750506040515192506101319050565b60408051918252519081900360200190f3",
    unlinked_binary: "60606040818152806102ac833960a09052516080516000805433600160a060020a0319918216811782161782556002939093556001805490931690911790915561025e90819061004e90396000f3606060405260e060020a600035046317bf8f50811461002657806390f551ec14610138575b005b61024c60043560243560008054819033600160a060020a03908116911614156101315760015460e060020a63511b1df90260609081526020606481815260076084527f506c75746f6e730000000000000000000000000000000000000000000000000060a452600160a060020a03939093169263511b1df99260c492918187876161da5a03f11561000257505060408051805193547f23b872dd000000000000000000000000000000000000000000000000000000008252600160a060020a039081166004830152808816602483015260448201879052915191841692506323b872dd916064828101926020929190829003018188876161da5a03f115610002575050604051519250505b5092915050565b61024c60043560243560008054819033600160a060020a03908116911614156101315760015460e060020a63511b1df90260609081526020606481815260096084527f506c75747573446578000000000000000000000000000000000000000000000060a452600160a060020a03939093169263511b1df99260c492918187876161da5a03f1156100025750506040805180516002547fed80577d000000000000000000000000000000000000000000000000000000008352600160a060020a03808a1660048501526024840189905260448401919091529251909450918416925063ed80577d916064828101926020929190829003018188876161da5a03f1156100025750506040515192506101319050565b60408051918252519081900360200190f3",
    address: "",
    generated_with: "2.0.9",
    contract_name: "PlutusUser"
  };

  function Contract() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusUser error: Please call load() first before creating new instance of this contract.");
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
      throw new Error("PlutusUser error: Please call load() first before calling new().");
    }

    return Contract.Pudding.new.apply(Contract, arguments);
  };

  Contract.at = function() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusUser error: Please call load() first before calling at().");
    }

    return Contract.Pudding.at.apply(Contract, arguments);
  };

  Contract.deployed = function() {
    if (Contract.Pudding == null) {
      throw new Error("PlutusUser error: Please call load() first before calling deployed().");
    }

    return Contract.Pudding.deployed.apply(Contract, arguments);
  };

  if (typeof module != "undefined" && typeof module.exports != "undefined") {
    module.exports = Contract;
  } else {
    // There will only be one version of Pudding in the browser,
    // and we can use that.
    window.PlutusUser = Contract;
  }

})();