pragma solidity >0.7.0 <0.9.0;
contract Demo1{
    bytes public name = "LE HONG VO";
    bytes32 public name1 = "NGUYEN VAN A";
    bytes32 public name2 = "TRAN THI B"; 
    // uint public currentTime = block.timestamp;
    // uint public dataIndex = block.timestamp;
    uint public deadline = 1648899357;
    
      function permit() public view returns(bool){
        if (block.timestamp <= deadline){
            return true;
        }else{
            return false;
        }
      }
}