// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    // this gets initialized to zero!
    uint256 public favoriteNumber;
    People public person = People({favoriteNumber: 6, name: "0xREALaldc"});
    People[] public peoples;
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //the use here for the _ in front of the variable it's to determine that _favoriteNumber is different
    // from favoriteNumber, we'll see more of naming conventions after
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //view functions doesn't cost gas and cannot modify state
    //pure functions also doesn't cost gas, but CANNOT modify state. Normally used inside the contract
    function retrieveFavoriteNumber() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //version aboe or below works as well
        // People memory newPerson = People(_favoriteNumber, _name);
        // peoples.push(newPerson);

        //the line below is a shorter version of the two above
        peoples.push(People(_favoriteNumber, _name));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}