// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract WalletInsegura {
    mapping (address => uint256) private balances;

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function depositFounds() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        require(balances[msg.sender] > 0, "Insufficient balance");

        (bool success, ) = payable(msg.sender).call{value: balances[msg.sender]}("");
        require(success, "Error al enviar eth");

        balances[msg.sender] = 0;
    }
}