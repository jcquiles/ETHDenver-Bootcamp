//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VulcanoCoin is Ownable {
    uint256 totalSupply = 10000;

    mapping(address => uint256) public balances;

    struct Payment {
        address recipient;
        uint256 amount;
    }

    mapping(address => Payment[]) public userPayments;

    event logSupply(uint256);
    event logTransfer(address, uint256);

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

    // Hw7: Make use of recordPayment()
    function transfer(address _recipient, uint256 _amount) public payable {
        recordPayment(msg.sender, _recipient, _amount);
    }


    // Difference with making mapping public: here it lists all payments of the user,
    // with mapping it needs an index -> only 1 payment
    function getUserPayments(address _user) public view returns(Payment[] memory) {
        require(_user != address(0), "Invalid address!");
        return userPayments[_user];
    }

    // Hw7: added
    function recordPayment(address _sender, address _receiver, uint256 _amount) public payable {
        require(_sender != address(0), "Invalid sender address!");
        require(_receiver != address(0), "Invalid receiver address!");
        require(_receiver != owner(), "Receiver can not be this contract!");
        require(_amount > 0, "Amount must be greater then 0!");
        require(balances[_sender] >= _amount, "Sender has not enough supply!");

        balances[_receiver] += _amount;
        balances[_sender] -= _amount;

        userPayments[_sender].push(Payment({recipient:_receiver, amount:_amount})); /*19b*/

        emit logTransfer(_receiver, _amount);
    }
}