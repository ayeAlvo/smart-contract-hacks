// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherStore {
    mapping(address => uint256) public balances;

    function depositFounds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 _balance = balances[msg.sender];
        require(_balance > 0);
        
        (bool success, ) = msg.sender.call{value: _balance}("");
        require(success, "Error");

        //se libera esapcio en la Blokchain y el consumo de GAS es mas bajo
        delete balances[msg.sender];
        //balances[msg.sender] = 0;
    }

    function getBalance() public view returns(uint256) {
        //retorna la direccion deployada de este contrato
        return address(this).balance;
    }
}