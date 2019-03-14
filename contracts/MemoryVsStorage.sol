pragma solidity ^0.5.1;

contract MemoryVsStorage {
    uint[] public numbers;
    
    constructor() public {
        numbers.push(34);
        numbers.push(16);
        numbers.push(91);
        numbers.push(29);
    }
    
    function changeArrayStorage () public returns (uint)  {
        uint[] storage myArrayStor = numbers; //when storage points to numbers array directly
        myArrayStor[0] = 1; 
        //when called myArrayStor[0] will be 1 instead of 34
        
    }
    
    function changeArrayMem() public view returns (uint) {
        uint[] memory myArrayMem = numbers; //will point to a new copy of array in memory
        myArrayMem[0] = 7;
        return myArrayMem[0]; 
        // myArray[0]  = 3; //exists in memory. _myArray[0] will be 1
    }
    
}

