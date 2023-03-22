// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DFPToken is ERC20 {

    address public owenr;

    constructor() ERC20("DFP","DFP"){
        owenr = msg.sender;
        _mint(msg.sender,100000 * 10 ** decimals());
    }

}