pragma solidity >0.4.0 <0.9.0;

import "./Memory.sol";

contract CmnPkg {
    uint256 constant public CROSS_CHAIN_KEY_PREFIX = 0x01006000;

    uint64 public data2 = 3345;
    uint8 public data3 = 30;
    bytes public dataX = "SIUDHSUIDB8923hdf8923hd8923efewf43f43f4";
    

    function getGeratekey(uint64 _sequence, uint8 _channelID) public view returns(bytes memory){
        return generateKey(_sequence,_channelID);
    }

    function getDecodekey(bytes memory payload) public view returns(bool, uint8, uint256, bytes memory){
        return decodePayloadHeader(payload);
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

    function decodePayloadHeader(bytes memory payload) internal pure returns(bool, uint8, uint256, bytes memory) {
    if (payload.length < 33) {
      return (false, 0, 0, new bytes(0));
    }

    uint256 ptr;
    assembly {
      ptr := payload
    }

    uint8 packageType;
    ptr+=1;
    assembly {
      packageType := mload(ptr)
    }

    uint256 relayFee;
    ptr+=32;
    assembly {
      relayFee := mload(ptr)
    }

    ptr+=32;
    bytes memory msgBytes = new bytes(payload.length-33);
    (uint256 dst, ) = Memory.fromBytes(msgBytes);
    Memory.copy(ptr, dst, payload.length-33);

    return (true, packageType, relayFee, msgBytes);
  }
}