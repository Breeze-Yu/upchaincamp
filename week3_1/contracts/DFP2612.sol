// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC2612/IERC2612.sol";
import "../node_modules/@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract DFP2612 is ERC20, IERC2612 {
    address public owner;
    mapping(address => uint256) public nonces;

    constructor() ERC20("DFP", "DFP") {
        owner = msg.sender;
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function depositWithSignature(
        address account,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external override {
        require(block.timestamp <= deadline, "Deposit expired");
        bytes32 messageHash = keccak256(abi.encodePacked(account, amount, deadline, nonces[account]++));
        require(ECDSA.recover(messageHash, v, r, s) == owner, "Invalid signature");
        _mint(account, amount);
    }

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external override {
        bytes32 domainSeparator = keccak256(
            abi.encode(
                keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
                keccak256(bytes(name())),
                keccak256(bytes("1")),
                block.chainid,
                address(this)
            )
        );
        bytes32 structHash = keccak256(abi.encode(permitTypehash, owner, spender, value, nonces[owner]++, deadline));
        bytes32 digest = keccak256(
            abi.encodePacked("\x19\x01", domainSeparator, structHash)
        );
        address recoveredAddress = ECDSA.recover(digest, v, r, s);
        require(recoveredAddress != address(0) && recoveredAddress == owner, "Invalid signature");
        _approve(owner, spender, value);
    }

    bytes32 public constant permitTypehash = keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

}