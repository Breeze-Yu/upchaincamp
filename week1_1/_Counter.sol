pragma solidity ^0.8.18;

contract counter{

    uint256 public num ;

    constructor(){
        num = 1 ;
    }

    function add(uint256 x) public{
        num = num + x;
    }  
}