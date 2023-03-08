pragma solidity >=0.7.0 <0.9.0;

contract counter{

    uint256 public num ;

    constructor(){
        num = 1 ;
    }

    function add(uint256 x) public{
        num = num + x;
    }  
}