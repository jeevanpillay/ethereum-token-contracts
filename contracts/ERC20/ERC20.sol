// contracts/ERC20.sol
pragma solidity ^0.6.0;

import "./IERC20.sol";
import "../math/SafeMath.sol";

/**
  * Implementation of the {IERC20} interface.
  *
  * Defined at https://eips.ethereum.org/EIPS/eip-20
  */
contract ERC20 is IERC20 {
  using SafeMath for uint256;

  mapping (address => uint256) private _balances;

  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;

  /**
    * Returns the total amount of tokens in existence.
    */
  function totalSupply() external view override returns (uint256) {
    return _totalSupply;
  }

  /**
    * Returns the total amount of tokens owned by an `account`.
    */
  function balanceOf(address account) external view override returns (uint256) {
    return _balances[account];
  }

  /**
    * Move `amount` from the caller's account to `recipient`
    *
    * Returns a bool indicating whether the transfer has succeeded
    *
    * Emits a { Transfer } event
    */
  function transfer(address recipient, uint256 amount) external override returns (bool) {

  }

  /**
   * Moves tokens `amount` from `sender` to `recipient`.
   *
   * This is internal function is equivalent to {transfer}, and can be used to
   * e.g. implement automatic token fees, slashing mechanisms, etc.
   *
   * Emits a {Transfer} event.
   *
   * Requirements:
   *
   * - `sender` cannot be the zero address.
   * - `recipient` cannot be the zero address.
   * - `sender` must have a balance of at least `amount`.
   */
  function _transfer(address sender, address recipient, uint256 amount) internal virtual {
    require(sender != address(0), "ERC20: transfer from zero address");
    require(recipient != address(0), "ERC: transfer to zero address");

    // TODO: make this safe
    _balances[sender] -= amount;
    _balances[recipient] += amount;
    emit Transfer(sender, recipient, amount);
  }

  /**
    * Move `amount` tokens from `sender` to `recipient` based on the allowance.
    * `amount` is deducated from the caller's allowance.
    *
    * Returns a bool indicating whether the transfer has succeeded
    *
    * Emits a { Transfer } event
    */
  function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {

  }

  /**
    * Sets `amount` as the allowance of `spender` over the caller's tokens.
    *
    * Returns a bool indicating whether the operation has succeeded.
    *
    * IMPORTANT: Beware that changing an allowance with this method brings the risk
    * that someone may use both the old and the new allowance by unfortunate
    * transaction ordering. One possible solution to mitigate this race
    * condition is to first reduce the spender's allowance to 0 and set the
    * desired value afterwards:
    * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    * Similar to a Race Attack!
    *
    * Emits an {Approval} event
    */
  function approve(address spender, uint256 amount) external override returns (bool) {

  }

  /**
    * Returns the remaining number of tokens that `spender` will be allowed
    * to spend on behave of the `owner` through the {transferFrom} function.
    *
    * Defaults at zero.
    *
    * This value changes when {approve} or {transferFrom} are called.
    */
  function allowance(address owner, address spender) external view override returns (uint256) {

  }

  /**
   * Emitted when `value` tokens are moved from one account (`from`) to
   * another (`to`).
   *
   * Note that `value` may be zero.
   */
  event Transfer(address indexed from, address indexed to, uint256 value);

  /**
   * @dev Emitted when the allowance of a `spender` for an `owner` is set by
   * a call to {approve}. `value` is the new allowance.
   */
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
