//3
// SPDX-License-Identifier: UNLICENSED

//2
pragma solidity ^0.8.0;

//4
contract VolcanoCoin {
    //5
    uint256 totalSupply = 10000;
    //8
    address owner;

    //13
    mapping(address => uint256) public balances; 

    //11
    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply; //15
    }

    //9
    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    //12
    event logSupply(uint256);
    //17
    event logTransfer(address, uint256);

    //18
    struct Payment {
        address recipient;
        uint256 amount;
    }

    //19
    mapping(address => Payment[]) public userPayments;

    //6
    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
    }
    
    //7 & //10
    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        emit logSupply(totalSupply);
    }

    //14 
    function getBalance(address _user) public view returns(uint256){
        require(_user != address(0), "Invalid address!");
        return balances[_user];
    }

    //16
   function Transfer(address recipient, uint256 amount) public payable {
    require(recipient != address(0), "Invalid address");
    require(amount > 0, "Invalid amount!");
    require(balances[msg.sender] >= amount, "User has not enough supply!");

    balances[recipient] += amount;
    balances[msg.sender] -= amount;

    userPayments[msg.sender].push(Payment({recipient:recipient, amount:amount}));
    
    emit logTransfer(recipient, amount);
   }
}
