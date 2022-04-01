pragma solidity 0.6.4;

contract Demo1{
    uint256 constant public CROSS_CHAIN_KEY_PREFIX = 0x01006000; // last 6 bytes

    function getDataGanerateKey(uint64 _sequence, uint8 _channelID) public view returns(bytes memory){
        return generateKey(_sequence, _channelID);
    }

    function generateKey(uint64 _sequence, uint8 _channelID) internal pure returns(bytes memory) {
        uint256 fullCROSS_CHAIN_KEY_PREFIX = CROSS_CHAIN_KEY_PREFIX | _channelID;
        bytes memory key = new bytes(14);

        uint256 ptr;
        assembly {
        ptr := add(key, 14)
        }
        assembly {
        mstore(ptr, _sequence)
        }
        ptr -= 8;
        assembly {
        mstore(ptr, fullCROSS_CHAIN_KEY_PREFIX)
        }
        ptr -= 6;
        assembly {
        mstore(ptr, 14)
        }
        return key;
    }
}