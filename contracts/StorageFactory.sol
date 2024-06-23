//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./SimpleStorage.sol";

contract StorageFactory{
    
    SimpleStorage[] public listOfStorageContracts;
    

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage (); // This function allows this contract to deploy another contract using the keyword "new"
        listOfStorageContracts.push (newSimpleStorageContract); 
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //Address
        //ABI - Application Binary Index
        SimpleStorage mySimpleStorage = listOfStorageContracts [_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }


}