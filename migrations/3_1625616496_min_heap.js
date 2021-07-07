const MinHeap = artifacts.require('MinHeap');

module.exports = function(deployer) {
  deployer.deploy(MinHeap);
};
