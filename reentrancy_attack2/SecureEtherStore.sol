// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherStore {
    mapping(address => uint256) public balances;

    function depositFounds() public payable {
        balances[msg.sender] += msg.value;
    }

  //Arreglo 3
  modifier security() {
    bool flag;
    require(!flag, "Error");
    flag = true;
    _;
    flag = false;
  }

    function withdraw() public security {
      // Arreglo 2
      // bool flag;
      // require(!flag, "Error");
      // flag = true;

        uint256 _balance = balances[msg.sender];
        require(_balance > 0);
        // Arreglo 1 - antes de la transacción
        delete balances[msg.sender];

        (bool success, ) = msg.sender.call{value: _balance}("");
        require(success, "Error");

        //se libera esapcio en la Blokchain y el consumo de GAS es mas bajo
        // delete balances[msg.sender];
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}