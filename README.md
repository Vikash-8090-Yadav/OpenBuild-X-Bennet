# OpenBuild-X-Bennet


![Screenshot from 2024-03-22 23-05-31](https://github.com/Vikash-8090-Yadav/OpenBuild-X-Bennet/assets/85225156/f391a4b7-f3bb-4dcc-bd46-ea02d89028c3)


## Let's deep dive into the advance topic of the smart contract!


#  What is modifiers ?


    Modifiers are code that can be run before or after a function call.
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
    
# What is  maps ?

 - Maps are a key-value store where you can associate a value with a specific key.
 - They are similar to dictionaries or hash maps in other programming languages.
 - Maps are defined using the syntax mapping(KeyType => ValueType) mapName;.
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
        address public  participant1 =0xa6B91Ab24F8D976A5f2119f5Dd7ed8886f8b2C03;
        address public  participant2 = 0x7719E64418C13c3Ab97e6f8500E81ce1101e8C40;
        mapping(address=>uint) user;
        mapping(address=>bool) chek;
    
        address public owner;
        constructor(){
            owner = msg.sender;
        }
    
        modifier onlyonwner(){
            require(msg.sender == owner,"You are not allowed to declare the result");
            _;
        }
    
        function participant1_vote()  public {
            require(msg.sender !=participant1,"You can not vote to yourself");
            require(chek[msg.sender]!=true,"You have already voted");
            user[participant1]++;
            chek[msg.sender] = true;
        }
            function participant2_vote()  public {
            require(msg.sender !=participant2,"You can not vote to yourself");
            require(chek[msg.sender]!=true,"You have already voted");
            user[participant2]+=1;
            chek[msg.sender] = true;
        }
    
        function pati1_cnt_VOTE() view public  returns(uint){
            return user[participant1];
    
        }
    
        function pati2_cnt_VOTE() view public  returns(uint){
            return user[participant2];
    
        }
    
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
