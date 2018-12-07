pragma solidity ^0.4.24;
 import "./TestPrivacy.sol";
 contract TestTestPrivacy is TestPrivacy {
    
    // only user added in the system can do this
    function testIsUserInAllowedList(){
        require (isUserInAllowedList(), "owner not in allowed list"); // returns (bool isUserAllowed)
    }
    
    // only owner
    function testAddNewUser(){
        address newUser = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148;
        addNewUser(newUser);
        require(allowedUsers[newUser], "User not added to the map");
    }
    
    // only user added in the system can do this
    function testShowHiddenValue(){
        showHiddenValue(); // returns (string _hiddenValue)
    }
    
    // only owner
    function testChangeHiddenValue(){
        string memory prevValue = showHiddenValue();
        string memory newValue = "testing";
        changeHiddenValue(newValue);
        require(keccak256(showHiddenValue()) == keccak256(newValue), "Value not changed");
    }
} 