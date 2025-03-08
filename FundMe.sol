// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract FundMe {

    uint256 public minimumUsd = 5;

    function fund() public payable {
        // allow users to send $
        // have a minimum 5$ sent
        // How do we send ETH to this contract?
        require(msg.value >= minimumUsd, "Didn't send the correct amount of ETH");
    }

    // function withdraw() public {}
}