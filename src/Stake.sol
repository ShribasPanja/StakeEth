// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Stake is Ownable {
    uint256 totalStakedToken;
    mapping(address => uint256) stakedAmount;
    address implementation;

    constructor(address _implementetion) public Ownable(msg.sender) {}

    function implement(address _implementetion) public onlyOwner {
        implementation = _implementetion;
    }

    fallback() external payable{
        (bool success,)=implementation.delegatecall(msg.data);
        require(success,"not succed");
    }
    
}

contract Stakeimplv1{
    uint dummy;
    uint256 totalStakedToken;
    mapping(address => uint256) stakedAmount;

    function stake(uint256 _amt) public payable {
        require(_amt > 0, "amount must be greater than 0");
        require(_amt == msg.value);
        totalStakedToken += _amt;
        stakedAmount[msg.sender] += _amt;
    }
    function unstake(uint256 _amt) public {
        require(stakedAmount[msg.sender] > _amt);
        payable(msg.sender).transfer(_amt);
        totalStakedToken -= _amt;
        stakedAmount[msg.sender] -= _amt;
    }
    
}
