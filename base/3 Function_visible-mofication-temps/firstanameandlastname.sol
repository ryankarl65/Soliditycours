pragma solidity ^0.8.1;

contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    uint256 openingTime = 1544613571;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }


    function addPerson(
    string memory _firstName,
    string memory _lastName
    )
    public onlyWhileOpen
      {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}