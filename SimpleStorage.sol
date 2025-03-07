// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // if no value is given then it defaults to 0
    uint256 myFavNum;

    // uint256[] listFavNum;
    struct Person {
        uint256 favNum;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavNum;

    function store(uint256 newFavNum) public virtual {
        myFavNum = newFavNum;
    }

    function retrieve() public view returns(uint256) {
        return myFavNum;
    }

    // calldata, memory,storage
    function addPerson(string memory _name, uint256 _favNum) public {
        listOfPeople.push(Person(_favNum, _name));
        nameToFavNum[_name] = _favNum;
    }

}