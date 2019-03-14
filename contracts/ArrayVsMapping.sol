pragma solidity ^0.5.1;

contract ArrayVsMapping {
    
    mapping (uint => uint)   mappingPrac;
    
    
    address[] addresses = [0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c, 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C, 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB, 0x583031D1113aD414F02576BD6afaBfb302140225, 0xdD870fA1b7C4700F2BD7f44238821C26f7392148];
    mapping(address => bool) public addressMap;
    
    constructor () public {
        addressMap[msg.sender] = true;
        
    }
    
    function checkArray() public view returns(bool) {
        for(uint i=0;i<addresses.length;i++) {
            if(addresses[i] == msg.sender) {
                return true;
            }
        }
    }
    
    
    function checkMap() public view returns (bool) {
        if (addressMap[msg.sender] == true) {
            return true;
        }
    }
    
    
}