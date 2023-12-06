// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract AshokuCoin is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address defaultAdmin, address minter) ERC20("AshokuCoin", "ACS") {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}

/*
I want to build a game where player starts by connecting metamask wallet and then play a quiz game to answer 5 questions. 
If all 5 questions are right, the user gets 0.5 ACS which will be minted using the token deplayment address and deposited to the player's metamask account. 
*/

