pragma solidity ^0.5.0;

import "./TestPrivacy.sol";

contract TestTestPrivacy is TestPrivacy {
    
    // only user added in the system can do this
    function testIsUserInAllowedList() public {
        require (isUserInAllowedList(), "owner not in allowed list"); // returns (bool isUserAllowed)
    }
    
    // only owner
    function testAddNewUser() public {
        address newUser = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
        addNewUser(newUser);
        require(allowedUsers[newUser], "User not added to the map");
    }
    
    // only user added in the system can do this
    function testShowHiddenValue() public {
        showHiddenValue(); // returns (string _hiddenValue)
    }
    
    // only owner
    function testChangeHiddenValue() public {
        string memory prevValue = showHiddenValue();
        string memory newValue = "testing";
        changeHiddenValue(newValue);
        require(keccak256(bytes(prevValue)) == keccak256(bytes(newValue)), "Value not changed");
    }
}