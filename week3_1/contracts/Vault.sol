// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;
import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault{

    address public owenr; 
    mapping(address => uint256) public balances;
    IERC20 public dfpToken;

    event saveMoney(address account,uint256 amount);
    event drawMoney(address account,uint256 amount);

    constructor(address dfp){
        owenr = msg.sender;
        dfpToken =  IERC20(dfp);
    }

    function deposite(uint256 amount) external  {
        dfpToken.transferFrom(msg.sender,address(this),amount);
        balances[msg.sender] += amount;
        emit saveMoney(msg.sender,amount);
    }

    function  withdraw(uint256 amount) external {
        require(balances[msg.sender]>=amount,"Insufficient balance");
        balances[msg.sender] -= amount;
        dfpToken.transfer(msg.sender,amount);
        emit drawMoney(msg.sender,amount);
    }

}