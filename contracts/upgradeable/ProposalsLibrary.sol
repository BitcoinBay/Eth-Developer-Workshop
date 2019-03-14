import "./EternalStorage.sol";

library ProposalsLibrary {

  function getProposalCount(address _storageContract) constant returns(uint256) 
  {
    return EternalStorage(_storageContract).getUIntValue(sha3("ProposalCount"));
  }

  function addProposal(address _storageContract, bytes memory _name)
  {
    var idx = getProposalCount(_storageContract);
    EternalStorage(_storageContract).setBytesValue(keccak256(abi.encodePacked("proposal_name", idx)), _name);
    EternalStorage(_storageContract).setUIntValue(keccak256(abi.encodePacked("proposal_eth", idx)), 0);
    EternalStorage(_storageContract).setUIntValue(keccak256(abi.encodePacked("ProposalCount")), idx + 1);
  }
}
