// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        // allow users to send $
        // have a minimum 5$ sent
        // How do we send ETH to this contract?
        require(getCOnversionRate(msg.value) >= minimumUsd, "Didn't send the correct amount of ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {}

    function getPrice() public view returns(uint256) {
        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // price of ETH in terms of USD
        return uint256(price * 1e10);
    }
    function getCOnversionRate(uint256 ethAmount) public view returns(uint256) {
        // 1 ETH?
        // 2000_000000000000000000
        uint256 ethPrice = getPrice();
        // (2000_000000000000000000 * 1_000000000000000000) / 1e18;
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}