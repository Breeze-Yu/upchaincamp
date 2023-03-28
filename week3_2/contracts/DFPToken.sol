// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 存储合约
contract DFPStorage {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// 逻辑合约
contract DFPLogic is DFPStorage, ERC20 {
    constructor() ERC20("DFP", "DFP") {}

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        // 添加自定义逻辑
        return super.transfer(recipient, amount);
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        // 添加自定义逻辑
        return super.approve(spender, amount);
    }
}
