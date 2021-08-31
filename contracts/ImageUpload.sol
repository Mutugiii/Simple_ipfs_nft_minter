// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Contract Image Uploader
/// @author Mutugi Mutuma
/// @notice Allows user to upload an image
/// @dev Image upload to IPFS
contract ImageUpload {
  struct Image {
    string ipfsHash;
    string title;
    uint256 uploadedOn;
  }

  mapping(address => Image[]) public imagesOwner;

  event ImageUploaded(
    address indexed owner,
    string ipfsHash,
    string title,
    uint256 uploadedOn
  );


  function uploadImage(
    string memory _ipfsHash,
    string memory _title
  ) 
    public 
    returns (bool _success)
  {
    require(bytes(_ipfsHash).length == 46);
    require(bytes(_title).length > 0 && bytes(_title).length <= 256); 

    uint256 _uploadedOn = block.timestamp;

    Image memory image = Image(
      _ipfsHash,
      _title,
      _uploadedOn
    );

    imagesOwner[msg.sender].push(image);

    emit ImageUploaded(
      msg.sender,
      _ipfsHash,
      _title,
      _uploadedOn
    );

    _success = true;
  }
  
  function getImageCount() public view returns (uint256) {
    return imagesOwner[msg.sender].length;
  }

  function getImage(uint8 _index) 
    public view returns (
    string memory _ipfsHash,
    string memory _title,
    uint256 _uploadedOn
  ) {
    require(_index >= 0 && _index <= 2**8 - 1);
    require(imagesOwner[msg.sender].length > 0);

    Image memory image = imagesOwner[msg.sender][_index];

    return (
      image.ipfsHash,
      image.title,
      image.uploadedOn
    );
  }
}