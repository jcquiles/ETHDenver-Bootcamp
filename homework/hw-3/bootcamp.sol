// SPDX-License-Identifier: None

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;

// variable to hold the address of the deployer of the contract
address deployer;

// update variable with the deployer's address when the contract is deployed
constructor() {
    deployer = msg.sender;
}

function getaddress () external view returns (address) {
    if (msg.sender == deployer) {
        return 0x000000000000000000000000000000000000dEaD;
} else {
  return deployer;
 }
}
    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }
}