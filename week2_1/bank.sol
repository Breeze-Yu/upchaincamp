// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract bank{

    address owenr;
    mapping (address => uint256) balances;
    constructor(){
        owenr = msg.sender;
    }

    //一个合约中最多可以有一个 receive 函数。在对合约转账时会执行 receive 函数
    //改方法只能外部使用
    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    //可用于合约中调用，记录合约转账
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    //提取金额到自己的地址
    function withdraw(uint256 amount) public{
        require(balances[msg.sender]>amount,'Insufficient Balance');
        //检查当前合约是否够钱
        require(address(this).balance>amount,'Bank Insufficient Balance');
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        
    }

    //查看余额
    function getBalance() public view returns(uint256){
        return balances[msg.sender];
    }

    //管理员提钱跑路
    function runAway(uint256 amount) public payable{
        require(msg.sender==owenr,'No permission');
        require(address(this).balance>amount,'Bank Insufficient Balance');
        (bool success,) = owenr.call{value:amount}("");
        require(success, "Failed to extract eth to the specified address!");
    }

    //管理员给别人打钱
    function giveMoney(address to,uint256 amount) public payable{
        require(msg.sender==owenr,'No permission');
        require(address(this).balance>amount,'Bank Insufficient Balance');
        (bool success,) = to.call{value:amount}("");
        require(success, "Failed to extract eth to the specified address!");
    }

    //查看合约余额
    function getContractBalance() public view returns(uint256){
        return address(this).balance;
    }

}