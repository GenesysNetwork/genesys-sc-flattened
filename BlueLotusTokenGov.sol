// SPDX-License-Identifier: MIT
/// @custom:security-contact iv7.software@gmail.com

/// MAX SUPPLY: 100M (100.000.000)*18e
/// Blue Lotus Governance Token (BLUEG) - Genesys Network 2022.
//         .=.A.=.
//   __.=./\ / \ /\.=.__
//  (-.'-;  |   |  ;-'.-)
//     \ `\/     \/` /
//      ;  `\   /`  ;
//      |    | |    |    Blue lotus - $BLUEG
//      ;,"-.-"-.-",;       Token
//       \\/^\ /^\//      Governance
//        \   `   /
//         ',___,'
//          \\V//
//           |||
//           |||
//           |||
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract BlueLotus is ERC20, Pausable, Ownable, ERC20Permit, ERC20Votes {
    constructor() ERC20("Blue Lotus", "BLUEG") ERC20Permit("Blue Lotus") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
