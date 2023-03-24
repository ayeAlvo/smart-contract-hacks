// SPDX-License-Identifer: MIT

//  version minor 0.8

pragma solidity ^0.6.0;

contract OverflowBasic {

  function overflow() public view returns(uint8) {
    // uint 8 max value 255
    // uint8 big = 255;
    uint8 big = 255 + uint8(1); // return 0
    return big;
  }
}