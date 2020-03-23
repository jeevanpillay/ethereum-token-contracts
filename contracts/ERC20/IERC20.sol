// contracts/IERC20.sol
pragma solidity ^0.6.0;

/**
  * The interface that defines the abstract implementation of the
  * ERC20 standard.
  *
  * Defined at https://eips.ethereum.org/EIPS/eip-20
  */
interface IERC20 {
  /**
    * Returns the total amount of tokens in existence.
    */
  function totalSupply() external view returns (uint256);

  /**
    * Returns the total amount of tokens owned by an `account`.
    */
  function balanceOf(address account) external view returns (uint256);

  /**
    * Move `amount` from the caller's account to `recipient`
    *
    * Returns a bool indicating whether the transfer has succeeded
    *
    * Emits a { Transfer } event
    */
  function transfer(address recipient, uint256 amount) external returns (bool);

  /**
    * Move `amount` tokens from `sender` to `recipient` based on the allowance.
    * `amount` is deducated from the caller's allowance.
    *
    * Returns a bool indicating whether the transfer has succeeded
    *
    * Emits a { Transfer } event
    */
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

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
  function approve(address spender, uint256 amount) external returns (bool);

  /**
    * Returns the remaining number of tokens that `spender` will be allowed
    * to spend on behave of the `owner` through the {transferFrom} function.
    *
    * Defaults at zero.
    *
    * This value changes when {approve} or {transferFrom} are called.
    */
  function allowance(address owner, address spender) external view returns (uint256);

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
