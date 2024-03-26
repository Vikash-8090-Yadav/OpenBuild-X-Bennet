# OpenBuild-X-Bennet


![Screenshot from 2024-03-22 23-05-31](https://github.com/Vikash-8090-Yadav/OpenBuild-X-Bennet/assets/85225156/f391a4b7-f3bb-4dcc-bd46-ea02d89028c3)


## Let's deep dive into the advance topic of the smart contract!

## Table of Contents

- [Pre-requisites](#pre-requisites) 🛠️
- [What is a Modifier?](#what-is-a-modifier-)
  - [Syntax](#syntax-) 
  - [Code Example](#code-example-) 
- [What is a Map?](#what-is-a-map-) 
  - [Syntax](#syntax-) 
  - [Code Example](#code-example-) 
- [Let's create one voting contract to use the above one in real life.](#lets-create-one-voting-contract-to-use-the-above-one-in-real-life-) 🗳️


# Pre-requisites

- Understanding of Solidity
- Familiarity with Blockchain Concepts
- Basic Programming Skills


#  What is modifier ?


 Modifier are code that can be run before or after a function call.
 Modifiers can be used to:

   - Restrict access
   - Validate inputs
   - Guard against reentrancy hack
 
  
## Syntax 

```
    modifier ModifierName(parameterList) {
    // Modifier code
    _; // This underscore represents the actual function body
    }

```

## Code 
        
 ```
        // SPDX-License-Identifier: UNLICENSED
        pragma solidity 0.8.7;
        
        contract Req {
            address public owner;
    
        constructor() {
            owner = msg.sender;
        }
    
        modifier onlyOwner() {
            require(owner == msg.sender, "You are not the owner");
            _;
        }
    
        function get10() public view onlyOwner returns (uint) {
            uint a = 10; 
            return 10;
        }
    }

  ```
    
# What is  map?

 - Map are a key-value store where you can associate a value with a specific key.
 - They are similar to dictionaries or hash maps in other programming languages.
 - Map are defined using the syntax mapping(KeyType => ValueType) mapName;.
 - They are particularly useful for storing data that needs to be looked up quickly based on a specific key.

## Syntax 

```
    mapping(KeyType => ValueType) mapName;
```

## code 

Simple code for updating the balnace of each address


```
        pragma solidity ^0.8.0;

contract Example {
    mapping(address => uint) public balances;

    function updateBalance(address _address, uint _balance) public {
        balances[_address] = _balance;
    }
}

```




 Here we have add a modifier called onlyowner , so now only the owner can access it otherwise it will through an error.

 

## Let's  create one voting contract to  use the above one  in real life. 


```
    // SPDX-License-Identifier: GPL-3.0
    
    pragma solidity >=0.7.0 <0.9.0;
    
    contract vote{
        string public winner;
        address public  participant1 =0xa6B91Ab24F8D976A5f2119f5Dd7ed8886f8b2C03; // Any  person address
        address public  participant2 = 0x7719E64418C13c3Ab97e6f8500E81ce1101e8C40; // Any peron address
        mapping(address=>uint) user; // it's used to store the number of vote per address
        mapping(address=>bool) chek; // it's used to check wether the particular address already voted or not 
    
        address public owner; // Address of the owner
        constructor(){
            owner = msg.sender;
        }
    // creation of the  modifier 

        modifier onlyonwner(){
            require(msg.sender == owner,"You are not allowed to declare the result");
            _;
        }

        // two candidate created named participant1_vote and participant2_vote, user have to vote to them. 
    
        function participant1_vote()  public {
            require(msg.sender !=participant1,"You can not vote to yourself"); // candidate can't vote to themselves
            require(chek[msg.sender]!=true,"You have already voted"); // voters can't vote twice
            user[participant1]++;  // vote  count increases per address 
            chek[msg.sender] = true; // check 
        }
            function participant2_vote()  public {
            require(msg.sender !=participant2,"You can not vote to yourself");
            require(chek[msg.sender]!=true,"You have already voted");
            user[participant2]+=1;
            chek[msg.sender] = true;
        }

        // anyonce can check the no of vote  particular candidate got
    
        function pati1_cnt_VOTE() view public  returns(uint){
            return user[participant1];
    
        }
    
        function pati2_cnt_VOTE() view public  returns(uint){
            return user[participant2];
    
        }
    // only owner can declare the winner 
    
        function declare_winner()  public  onlyonwner {
            if(user[participant1]>user[participant2]){
                winner = "Candidate 1 is winner";
                // winner = _winner;
            }
            else if(user[participant1]==user[participant2]){
                winner = "Draw";
                // winner = _winner;
    
            }
            else{
                winner = "Candidate 2 is winner";
                // winner = _winner;
    
            }
        }
    
    }
```
