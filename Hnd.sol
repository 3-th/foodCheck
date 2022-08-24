// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Hnd {

    struct Order {
        string productName;
        address seller;
        bool complete;
    }

    Order[] public orders;
        address public seller;
        address public buyer;
        address public inspector;

    constructor() {
        buyer = msg.sender;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer);
        _;
    }

    modifier onlyInspector() {
        require(msg.sender == inspector);
        _;
    }

    function beInspector() public {
        inspector = msg.sender;
        require(buyer != inspector);
        require(seller != inspector);
    }
        
    function createOrder(string memory _productName, address _seller) public onlyBuyer {
        Order memory newOrder = Order({
        productName: _productName,
        seller: _seller,
        complete: false    
        });

        orders.push(newOrder);
    }

    function approveOrder() public onlyInspector {

    }

}

// approveOrder
// finalizeOrder 
