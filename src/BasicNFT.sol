//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint private s_tokenCounter;
    mapping(uint => string) private s_tokenIdToTokenURI;

    constructor() ERC721("Basic NFT", "BNFT") {}

    function mintNFT(string memory _tokenURI) public {
        s_tokenCounter++;
        s_tokenIdToTokenURI[s_tokenCounter] = _tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function tokenURI(
        uint _tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToTokenURI[_tokenId];
    }
}
