pragma solidity ^0.8.18;

import "hardhat/console.sol";

contract Counter{

    uint256 public counter ;
    address owner;
    
    constructor(uint x){
        counter = x ;
        owner = msg.sender;
    }

    function count() public{
        require(msg.sender == owner,'not the create_user');
        counter = counter + 1;
        console.log("counter is %s ", counter);
    }

    function add(uint256 x) public{
        counter = counter + x;
    }  

    function get() public view returns(uint){
        return counter;
    }
}