const Pluton = artifacts.require("./Pluton.sol");

module.exports = function(deployer) {
  deployer.deploy(Pluton);
};
