pragma solidity ^0.8.0;

contract Demo1{
   
    address[] public listArray;

    constructor(){
        listArray.push(0x3Cb06A7709a2511e48a091979b9b68B27999AfaB);
        listArray.push(0xCdA189005BFBe90bc2D518f69FfB937EcdFfB3f3);
        listArray.push(0x441D3f30Ea410492073C9ED263adfacb0CB4C95F);
        listArray.push(0xCcf25B3e56cA33859F20622C83CB380693092FE2);
    }

    function checkData(address _address) public view returns(bool, uint256){
        (bool foundToken, uint256 tokenIndex) = findElementPosition(
            _address
        );
        return (foundToken, tokenIndex);
    }

    function findElementPosition(address _token) internal view returns (bool, uint256){
        for (uint256 i = 0; i < listArray.length; i++) {
            if (listArray[i] == _token) {
                return (true, i);
            }
        }
        return (false, 0);
    }

}