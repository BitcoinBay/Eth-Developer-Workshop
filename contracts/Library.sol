pragma solidity ^0.5.1;

library IntExtended {
    
    function increment(uint _self) internal pure returns (uint) {
        return _self+1;
    }
    
    function decrement(uint _self) internal pure returns (uint) {
        return _self-1;
    }
    
    function incrementByValue(uint _self, uint _value) internal pure returns (uint) {
        return _self + _value;
    }
    
    function decrementByValue(uint _self, uint _value) internal pure returns (uint) {
        return _self - _value;
    }
}



contract TestLibrary/* is IntExtended */ {
    using IntExtended for uint;
    
    function testIncrement(uint _base) public pure returns (uint) {
        return IntExtended.increment(_base);
    }
    
    function testDecrement(uint _base) public pure returns (uint) {
        return IntExtended.decrement(_base);
    }
    
    function testIncrementByValue(uint _base, uint _value) public pure returns (uint) {
        // return _base.incrementByValue(_value);
        return IntExtended.incrementByValue(_base, _value);
    }
    
    function testDecrementByValue(uint _base, uint _value) public pure returns (uint) {
        // return _base.decrementByValue(_value);
        return IntExtended.decrementByValue(_base, _value);
    }
}

