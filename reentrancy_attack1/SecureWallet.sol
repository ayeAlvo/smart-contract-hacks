// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract WalletSegura {
    bool internal bloqueado;
    mapping (address => uint256) private balances;

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function depositFounds() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external proteger{
        require(balances[msg.sender] > 0, "Insufficient balance");
        balances[msg.sender] = 0;
        (bool success, ) = payable(msg.sender).call{value: balances[msg.sender]}("");
        require(success, "Error al enviar eth");
    }

    modifier proteger() {
        require(!bloqueado, "Llamada de ataque");
        bloqueado = true;
        _;
        bloqueado = false;
    }
}
