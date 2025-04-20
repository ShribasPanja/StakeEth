// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Orcacoin is ERC20{
    constructor() ERC20("ORCA","ORC"){}
    function mint(address _to, uint256 _amt) public{
        _mint(_to,_amt);
    }
}