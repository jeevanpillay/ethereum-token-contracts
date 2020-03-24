// contracts/ERC20Capped.sol
pragma solidity ^0.6.0;

import './ERC20.sol';

/**
 * @dev Extension of {ERC20} that adds a cap to the supply of tokens.
 */
contract ERC20Capped is ERC20 {
  uint256 private _cap;

  constructor (uint256 cap) public {
    require(cap > 0, "ERC20Capped: cap is 0");
    _cap = cap;
  }

  /**
   * @dev Returns the cap on the token's total supply.
   */
  function cap() public view returns (uint256) {
    return _cap;
  }
}
