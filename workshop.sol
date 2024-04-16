

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Test {
//   Eevnts and  index

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

    //  For the abi.encdoe data 

    function combineData(uint256 number, address addr, string memory text) public pure returns (bytes memory) {
        // Pack the data together using abi.encodePacked
        bytes memory packedData = abi.encodePacked(number, addr, text);
        return packedData;
    }

    //   f


    function calculateHash(string memory data) public pure returns(bytes32) {
        // Calculate the keccak256 hash of the input data
        return keccak256(abi.encodePacked(data));
    }


}
