// SPDX-License-Identifier: MIT
// @title TestImmutable
// @note Introduced in 0.6.0 `immutable`

pragma solidity >0.6.4 <0.7.0;

contract TestImmutable {
    uint constant X = 32**22 + 8;
    string constant TEXT = "abc";
    bytes32 constant MY_HASH = keccak256("abc");
    uint immutable decimals;
    uint immutable maxBalance;
    address immutable owner = msg.sender;

    constructor(uint _decimals, address _reference) public {
        decimals = _decimals;
        // Assignments to immutables can even access the environment.
        maxBalance = _reference.balance;
    }

    function isBalanceTooHigh(address _other) public view returns (bool) {
        return _other.balance > maxBalance;
    }
}
