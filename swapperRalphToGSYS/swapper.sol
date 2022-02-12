// SPDX-License-Identifier: MIT
/// @custom:security-contact iv7.software@gmail.com
/// code by Iv7.dev
/// Genesys Network 2022.-
/// By CryptoClub

pragma solidity 0.8.6;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Router {
  function swapExactTokensForTokens(
    uint amountIn,
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline
  ) external returns (uint[] memory amounts)  {}
}

contract Swapper
{
  Router router = Router(0xeeeeeeeeeeeeeeeeeee); // ADDR Router Genesys DEX
  ERC20 RALPH_token  = ERC20(0xeeeeeeeeeeeeeeeeeeeeeeeeeee); // ADDR ralph Token
  ERC20 GSYS_token = ERC20(0xeeeeeeeeeeeeeeeeeeeeeeeee); // ADDR gsys token

  function swapRalphToGsys(uint amount) public
  {
    RALPH_token.transferFrom(
      msg.sender,
      address(this),
      amount
    );

    address[] memory path = new address[](2);
    path[0] = address(RALPH_token);
    path[1] = address(GSYS_token);

    RALPH_token.approve(address(router), amount);

    router.swapExactTokensForTokens(
      amount,
      0,
      path,
      msg.sender,
      block.timestamp
    );
  }
}