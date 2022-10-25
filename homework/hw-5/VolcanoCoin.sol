//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; /*2*/

// added
import "@openzeppelin/contracts/access/Ownable.sol";

contract VulcanoCoin is Ownable /*added*/ {
    uint256 totalSupply = 10000;

    mapping(address => uint256) public balances;

    struct Payment {
        address recipient;
        uint256 amount;
    }

    mapping(address => Payment[]) public userPayments;

    event logSupply(uint256);
    event logTransfer(address, uint256);

    // changed to inherit constructor from parent Ownable.sol
    constructor() Ownable() {
        balances[owner()] = totalSupply;
    }

    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
    }

    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        emit logSupply(totalSupply);
    }

    function getBalance(address _user) public view returns(uint256){
        require(_user != address(0), "Invalid address!");
        return balances[_user];
    }

    function transfer(address _recipient, uint256 _amount) public payable {
        require(_recipient != address(0), "Invalid address");
        require(_amount > 0, "Invalid amount!");
        require(balances[msg.sender] >= _amount, "User has not enough supply!");

        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;

        userPayments[msg.sender].push(Payment({recipient:_recipient, amount:_amount})); /*19b*/

        emit logTransfer(_recipient, _amount);
    }

    function getUserPayments(address _user) public view returns(Payment[] memory) {
        require(_user != address(0), "Invalid address!");
        return userPayments[_user];
    }
}