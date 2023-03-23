// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract Wallet {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function deposit() public payable {}

  function transfer(address payable _to, uint _amount) public {
    require(tx.origin == owner, "Now owner");

    _to.transfer(_amount);
  }

  function getBalance() public view returns(uint) {
    return address(this).balance;
  }
}
