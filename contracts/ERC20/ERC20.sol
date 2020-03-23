// contracts/ERC20.sol
pragma solidity ^0.6.0;

import "./IERC20.sol";
import "../math/SafeMath.sol";
import "../GSN/Context.sol";

/**
  * Implementation of the {IERC20} interface.
  *
  * Defined at https://eips.ethereum.org/EIPS/eip-20
  */
contract ERC20 is IERC20, Context {
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
    _transfer(_msgSender(), recipient, amount);
    return true;
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

    _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
    _balances[recipient] += _balances[recipient].add(amount);

    emit Transfer(sender, recipient, amount);
  }

  /**
    * Move `amount` tokens from `sender` to `recipient` based on the allowance.
    * `amount` is deducated from the caller's allowance.
    *
    * Returns a bool indicating whether the transfer has succeeded
    *
    * Emits a {Transfer} event
    */
  function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
    _transfer(sender, recipient, amount);
    _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance")); // This line deducts the allowed amount from the allocate msg.sender allowance from sender.
    return true;
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
    _approve(_msgSender(), spender, amount);
    return true;
  }


  /**
   * Sets `amount` as the allowance of `spender` over the `owner`s tokens.
   *
   * This is internal function is equivalent to `approve`, and can be used to
   * e.g. set automatic allowances for certain subsystems, etc.
   *
   * Emits an {Approval} event.
   *
   * Requirements:
   *
   * - `owner` cannot be the zero address.
   * - `spender` cannot be the zero address.
   */
  function _approve(address owner, address spender, uint256 amount) internal virtual {
    require(owner != address(0), "ERC20: approve from zero address");
    require(spender != address(0), "ERC: approve to zero address");

    _allowances[owner][spender] = amount;

    emit Approval(owner, spender, amount);
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
    return _allowances[owner][spender];
  }
}
