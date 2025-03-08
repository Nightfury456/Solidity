// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract FundMe {
    function fund() public payable {
        // allow users to send $
        // have a minimum $ sent
        // How do we send ETH to this contract?
        require(msg.value > 1e18, "Didn't send the correct amount of ETH");
    }

    // function withdraw() public {}
}