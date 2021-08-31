// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/// @title NFT Minter
/// @author Mutugi Mutuma
/// @notice Allows a user to mint an NFT from the image they previously uploaded
/// @dev Image Simpler ERC721 approach as compared to importing libaries such as OpenZeppelin.
contract NFTMint {
  uint256 internal tokenCounter;
  mapping(uint256 => address) internal idToOwner;

  constructor() {
    tokenCounter = 1;
  }

  event Mint(
    address indexed _owner,
    uint256 indexed _tokenId,
    bytes32 _ipfsHash
  );

  function increaseTokenCounter() internal {
    tokenCounter++;
  }

  function mint(bytes32 _ipfsHash) public {
    uint256 _tokenId = tokenCounter;
    idToOwner[_tokenId] = msg.sender;
    increaseTokenCounter();

    emit Mint(msg.sender, _tokenId, _ipfsHash);
  }
}