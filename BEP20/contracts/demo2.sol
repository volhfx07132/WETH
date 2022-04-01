pragma solidity >0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract demo2 {
    function getData(uint16 _postfix) public view returns(uint){
        return sizeOfInt(_postfix);
    }
    // value is string and convert strinf to uint -< and return data type of value

    function addressToBytes(uint _offst, address _input, bytes memory _output) internal pure {
        bytes memory _output
        assembly {
            mstore(add(_output, _offst), _input)
        }
    }
} 
            