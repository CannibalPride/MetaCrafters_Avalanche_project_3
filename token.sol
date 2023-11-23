// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


//    Only contract owner should be able to mint tokens
//    Any user can transfer tokens
//    Any user can burn tokens

// Custom ERC20 token contract that inherits from the OpenZeppelin ERC20 base contract.
contract ERC20Contract is ERC20 {
    address public owner;
    address public user;

    // Modifier to ensure that the provided address is valid.
    modifier validAddress(address addr) {
        require(addr != address(0), "REQUIRE: Invalid Address");
        _;
    }

    // Modifier to ensure that the provided amount is greater than zero.
    modifier greaterThanZero(uint256 amount) {
        require(amount > 0, "REQUIRE: Amount must be greater than 0");
        _;
    }

    // Modifier to ensure that the sender is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "REQUIRE: Only the owner can call this function");
        _;
    }

    // Constructor to initialize the token with a name, abbreviation, and initial supply.
    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        uint256 initialSupply
    ) 
    ERC20(tokenName, tokenSymbol) {
        require(bytes(tokenName).length > 0, "Token name is empty!");
        require(bytes(tokenSymbol).length > 0, "Token symbol is empty!");
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    // Function to mint tokens and assign them to a specified address. Only the contract owner can call this function.
    function mintTokens(address account, uint256 amount) public onlyOwner validAddress(account) greaterThanZero(amount) {
        _mint(account, amount);
    }

    // Function to burn tokens from the user's balance.
    function burnTokens(address account, uint256 amount) public validAddress(account) greaterThanZero(amount) {
        require(balanceOf(account) >= amount, "REQUIRE: Insufficient balance");
        _burn(account, amount);
    }

    // Transfer function to allow users to transfer tokens.
    function transfer(address spender, uint256 amount) public override validAddress(spender) greaterThanZero(amount) returns (bool) {
        require(balanceOf(owner) >= amount, "REQUIRE: Insufficient balance");
        _transfer(user, spender, amount);
        return true;
    }

    // Function to change the account address.
    function setAccount(address useraddress) public {
        user = useraddress;
    }

    // Approve function to allow users to approve spending tokens.
    function approve(address spender, uint256 amount) public override validAddress(spender) returns (bool) {
        _approve(user, spender, amount);
        return true;
    }

    // TransferFrom function to allow users to transfer tokens from an approved allowance.
    function transferFrom(address from, address to, uint256 amount) public override validAddress(to) greaterThanZero(amount) returns (bool) {
        require(balanceOf(from) >= amount, "REQUIRE: Insufficient balance");
        require(allowance(from, user) >= amount, "REQUIRE: Allowance exceeded");
        _transfer(from, to, amount);
        _approve(from, user, allowance(from, user) - amount);
        return true;
    }
}
