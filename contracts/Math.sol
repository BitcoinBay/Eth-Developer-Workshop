pragma solidity ^0.5.1;
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

contract MathSession {
    
    //UINT VS INT
    function brokenInt() public view returns(uint,int) {
        uint a = 0;
        int b = 0;
        a--;
        b--;
        return(a,b);
    }
    
    uint c1;
     function gasTestUInt() public returns(uint) {
        uint a = 3;
        uint b = 3;
        uint c1 = a * b;
        return c1;
    }
    int c2;
     function gasTestInt() public returns(int) {
        int a = 3;
        int b = 3;
        c2 = a * b;
        return c2;
    }
    
    
    //UIN16 VS. 256 -> Gas Considerations
    function gastTest8() public pure returns(uint8){
        uint8 a = 5;
        uint8 b = 5;
        return a*b;
    }
    
    function gasTest64() public pure returns(uint64) {
        uint64 a = 5;
        uint64 b = 5;
        return a*b;
    }
    

     function gastTest256() public pure returns(uint){
        uint256 a = 5000;
        uint b = 5000; //uint by default is uint256
        return a*b;
    }
    
    
    
    ///Implemenet Safemath///
    function useSafeMath() public pure returns(uint){
        uint a = 5555;
        uint b = 2222;
        
        uint c = SafeMath.mul(a,b);
        return c;
    }
    
    function brokenSafeMath() public pure returns(uint){
        uint a = 0;
        a--;
        uint b = 2222;
        uint c = SafeMath.mul(a,b);
        return c;
    }
    
    
    
    
}