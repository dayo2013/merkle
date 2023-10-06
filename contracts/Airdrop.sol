// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Airdrop  is ERC20{
    bytes32 public merkleRoot;

    //custom error
    error Hasbeclaimed();
    error whiteListed();

    mapping (address => bool) public claimed;

    constructor(bytes32 _merkleRoot) ERC20("Airdrop", "Arp"){
        merkleRoot = _merkleRoot;

    }
    function claim(uint256 _account, uint256 amount, bytes32[] calldata merkleProof) external returns (bool){
        require(!claimed[_account], "has be claimed");
        bytes32 leaf = keccak256(abi.encodePacked(_account, amount));
        require(!MerkleProof.verify(merkleProof, merkleRoot, leaf), "invalid proof");


     
     

         
    claimed[_account] = true;
    _mint(_account , amount);
    return;
    }



}























































































































//0xc87618c6c49eb4b0825fe2b7323eb2d0a34647d57571acbc0eed60825db81123