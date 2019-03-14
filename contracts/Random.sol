pragma solidity ^0.4.24;

import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.25.sol";


contract RandomDatasourceExample is usingOraclize {
    uint public randomNumber;
    event failedVerification();
     constructor() public payable {
         oraclize_setProof(proofType_Ledger); 
     }
     function __callback(bytes32 _queryId, string _result, bytes _proof) public  {
         require(msg.sender == oraclize_cbAddress());
         if (oraclize_randomDS_proofVerify__returnCode(_queryId, _result, _proof) == 0) { 
            // uint maxRange = 2 ** (8 * 7);
            randomNumber = uint(keccak256(abi.encodePacked(_result))) % 100;
         } else {
            emit failedVerification();
         }
     }
     function getRandomNumber() public payable {
         uint numberOfBytes = 3;
         uint delay =0;
         uint callbackGas = 200000;
         bytes32 queryId = oraclize_newRandomDSQuery(delay, numberOfBytes, callbackGas); //receives data from ledger random number generator
     }
}

