pragma solidity ^0.4.15;

import "./TokenLedger.sol";
import "./ProposalsLibrary.sol";
import "./EternalStorage.sol";

contract Organisation
{
  ITokenLedger public tokenLedger;
  using ProposalsLibrary for address;
  address public eternalStorage;



  function Organisation(address _tokenLedger, address _eternalStorage) {
    tokenLedger = ITokenLedger(_tokenLedger);
    eternalStorage = _eternalStorage;
  }

  function addProposal(bytes memory _name)
  {
    eternalStorage.addProposal(_name);
  }

  function proposalsCount() constant returns (uint256)
  {
    return eternalStorage.getProposalCount();
  }

  /*function getProposal(uint256 _id) constant returns (bytes32 _name, uint256 _eth)
  {
    return eternalStorage.getProposal(_id);
  }

  function updateProposal(uint256 _id, bytes32 _name)
  {
    eternalStorage.updateProposal(_id, _name);
  }

  function fundProposal(uint256 _id)
  {
    eternalStorage.fundProposal(_id);
  }

  function setProposalFund(uint256 _id, uint256 _eth)
  {
    eternalStorage.setProposalFund(_id, _eth);
  }
   function getBalance(address _account) constant returns (uint256)
  {
    return tokenLedger.balanceOf(_account);
  }


  function kill(address upgradedOrganisation_)
  {
    var tokenBalance = tokenLedger.balanceOf(this);
    tokenLedger.transfer(upgradedOrganisation_, tokenBalance);
    selfdestruct(upgradedOrganisation_);
  }

  */

  function generateTokens(uint256 _amount)
  {
    tokenLedger.generateTokens(_amount);
  }



}
