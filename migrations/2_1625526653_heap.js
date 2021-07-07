const Heap = artifacts.require('Heap');

module.exports = function(deployer) {
  deployer.deploy(Heap, false);
};
