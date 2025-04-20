// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Orcacoin.sol";

contract TestOracoin is Test{
    Orcacoin token;
    function setUp() public{
        token = new Orcacoin();
    }
    function testmint()public{
        token.mint(address(this),50);
        assertEq(token.balanceOf(address(this)),50);
    }
}
