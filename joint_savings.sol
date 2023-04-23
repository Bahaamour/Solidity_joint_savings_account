// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;


contract JointSavings{
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw; 
    uint public lastWithdrawAmount;
    uint public contractBalance;

    function withdraw(uint amount, address payable recipient) public {
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(address(this).balance >= amount, "Insufficient amount!");

        if (lastToWithdraw != recipient) {
        lastToWithdraw = recipient;
        }

        recipient.transfer(amount);
        lastWithdrawAmount = amount;
        contractBalance = address(this).balance;
    }


    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        contractBalance = address(this).balance;
    }


    function setAccounts(address payable account1, address payable account2) view public{

        account1 = accountOne;
        account2 = accountTwo;

    }

    function() external payable {
        contractBalance = address(this).balance;
  }

   
}
