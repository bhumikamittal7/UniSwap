// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

 
contract Token is Ownable, ERC20 {
    string private constant _symbol = 'YB';                 // token symbol - all caps
    string private constant _name = 'AshokuCoin';                 // token name
    bool allowMinting = true;                        // whether or not minting is allowed - minting means creating more tokens

    constructor() ERC20(_name, _symbol) {}

    /* ======================================================================================================================= */
    // Function mint: Create more of your tokens.

    function mint(uint amount) 
        public 
        onlyOwner
    {
        /******* TODO: Implement this function *******/
        //if minting is allowed, we mint the amount of tokens specified by the user.
        //msg.sender is the owner of the contract and the one who is minting the tokens.
        //amount is the amount of tokens to be minted.
        //these tokens are added to the total supply of tokens and the balance of the owner.

        if (allowMinting) {
            _mint(msg.sender, amount);
        }

    }

    // Function disable_mint: Disable future minting of your token.
    function disable_mint()
        public
        onlyOwner
    {
        /******* TODO: Implement this function *******/
        allowMinting = false;
    }
}
/* ======================================================================================================================= */
