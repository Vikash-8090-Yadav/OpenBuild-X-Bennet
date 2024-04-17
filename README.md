# OpenBuild-X-Bennet


![Screenshot from 2024-03-22 23-05-31](https://github.com/Vikash-8090-Yadav/OpenBuild-X-Bennet/assets/85225156/f391a4b7-f3bb-4dcc-bd46-ea02d89028c3)


Join OpenBuild Community: https://t.me/OpenBuildxyz

## Let's deep dive into the advance topic of the smart contract!

# Pre-requisites

- Understanding of Solidity
- Familiarity with Blockchain Concepts
- Basic Programming Skills
- Remix ide already setup


**Open the renix: https://remix.ethereum.org/**

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

#  What is Event ?

Events are like announcements inside a smart contract. for ex, f someone buys an item in a marketplace contract, an event can be triggered to let everyone know that the purchase took place.

Inexed: Indexed parameters are like tags that make events easier to find later. for ex,  If you have a big list of events, and you want to find all the events related to a specific person. If you index the parameter for that person's address, it's like putting a label on those events so you can quickly find them later.


Benifiets: Eventa saves lots of gas fees!!

 ### Code 

 ```
 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Test {


    event Donation(address indexed from, string name, string message, uint256 timestamp, uint256 amount);

     constructor() {
        Rowner = payable(msg.sender);
    }

    struct Memo {
        string name;
        string message;
        uint timestamp;
        address from;
    }

    Memo[] memos;
    address payable public Rowner;

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    

    function buyChai(string memory name, string memory message) public payable {
        require(msg.value > 0, "Please pay something greater than 0");
        Rowner.transfer(msg.value); // Will transfer donator's money to the smart contract owner
        memos.push(Memo(name, message, block.timestamp, msg.sender)); // Now we will add that donator to our donators list

        // Emit the Donation event
        emit Donation(msg.sender, name, message,  block.timestamp, msg.value);
        
    }

    // You can get a list of all donators and the total holdings of funds by this function on the frontend
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }

    function getBalance() public view returns (uint256) {
        return Rowner.balance;
    }

}
```

# What is abi.encodePacked and it's functionality,

abi.encodePacked is a function in Solidity that packs together different types of data.
It takes whatever you give it—numbers, text, or even addresses—and combines them into a single packed result.

For ex, Imagine you have some items, like apples and oranges, and you want to pack them into a box. But the box can only hold one type of thing. If you try to put both apples and oranges in the same box, they might get mixed up. abi.encodePacked solves this problem by packing everything together in a way that keeps them separate.

 ### code 

```

pragma solidity ^0.8.0;

contract ExampleContract {
    function combineData(uint256 number, address addr, string memory text) public pure returns (bytes memory) {
        // Pack the data together using abi.encodePacked
        bytes memory packedData = abi.encodePacked(number, addr, text);
        return packedData;
    }
}

```


 # what is keccak256:
keccak256 is a cryptographic hash function used to generate a unique 256-bit (32-byte) hash value from input data. 
It's commonly used for various purposes like creating unique identifiers, securely storing passwords, or verifying data integrity.

### Code 

`
function calculateHash(string memory data) public pure returns(bytes32) {
        // Calculate the keccak256 hash of the input data
        return keccak256(abi.encodePacked(data));
    }
`
calculateHash function takes a string data as input, encodes it using abi.encodePacked, and then computes the keccak256 hash of the encoded data.
    


## Comparision b/w Keecak25 and SHA 256 

keccak256 and SHA256 are both ways to crunch data down into a fixed-size string of numbers and letters, making it hard to reverse-engineer the original data. They're like magic boxes that take your data and turn it into a secret code.

| S No. | SHA-256                                          | Keccak-256                                                        |
|-------|--------------------------------------------------|-------------------------------------------------------------------|
| 1.    | SHA-256 is the implementation of the SHA-2       | Keccak256, a cryptographic function, is part of Solidity          |
|       | standard with a 256 bits key.                    | (SHA-3 Family).                                                   |
| 2.    | SHA-256 is weaker than Keccak-256.               | Keccak-256 is much stronger compared to SHA-256.                  |
| 3.    | Computes the SHA-256 hash of the input.          | Computes the Keccak-256 hash of the input.                        |
| 4.    | sha256(bytes memory) returns (bytes32).          | keccak256(bytes memory) returns (bytes32).                        |
| 5.    | The Bitcoin blockchain makes extensive use of    | Ethereum uses Keccak-256 in a consensus engine called Ethash.      |
|       | SHA-256, including when identifying transaction  |                                                                   |
|       | hashes and when miners are performing proof-of-  |                                                                   |
|       | work mining.                                     |                                                                   |


**Both boxes do the same job — turning data into secret codes — but they use different tricks to do it.**

Explore sha256 and keeckak256 in depth here: https://cryptobook.nakov.com/cryptographic-hash-functions/secure-hash-algorithms

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




If u like this repo then show some ❤️ by giving ⭐ to this .


