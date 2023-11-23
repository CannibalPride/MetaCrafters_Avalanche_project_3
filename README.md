# ERC20Contract Smart Contract

This is an Ethereum ERC-20 token smart contract created using Solidity. The contract inherits from the OpenZeppelin ERC20 base contract and includes custom functionality for minting, burning, and transferring tokens. This is for submission for Metacrafters Avalanche and is for demonstration purposes only

## Overview

- **Token Name:** ERC20TokenName
- **Token Symbol:** ERC20TokenSymbol
- **Initial Supply:** ERC20TokenInitialSupply

## Contract Functions

1. **Constructor**: Initializes the contract with the provided token name, symbol, and initial supply. Only the contract deployer is set as the owner.

2. **`mintTokens(address account, uint256 amount)`**: Allows the contract owner to mint tokens and assign them to a specified address.

3. **`burnTokens(address account, uint256 amount)`**: Allows any user to burn tokens from their own balance.

4. **`setAccount(address changeAccount)`**: Sets the user's account address.

5. **`transfer(address spender, uint256 amount)`**: Allows any user to transfer tokens to another address.

6. **`approve(address spender, uint256 amount)`**: Allows any user to approve spending tokens by a designated spender.

7. **`transferFrom(address from, address to, uint256 amount)`**: Allows any user to transfer tokens from an approved allowance.

## Usage

- Deploy the contract with the desired token name, symbol, and initial supply.
- The contract deployer becomes the owner of the contract.
- The owner can mint tokens to any address using the `mintTokens` function.
- Any user can burn tokens using the `burnTokens` function.
- Any user can transfer tokens to other addresses using the `transfer` function.
- Users can set their account address using the `setAccount` function.
- Users can approve spending of their tokens by other addresses using the `approve` function.
- Users can transfer tokens from an approved allowance using the `transferFrom` function.
