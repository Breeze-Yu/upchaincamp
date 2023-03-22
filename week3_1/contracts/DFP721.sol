// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract DFP721 is ERC721{

    //工具包计数器
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721(unicode"集训营二期学员卡","DFP"){

    }

    function mint(address student,string memory tokenURI) public returns(uint256){
        uint256 tokenId = _tokenIds.current();
        _mint(student,tokenId);
        _tokenIds.increment();

        return tokenId;
    }
}

