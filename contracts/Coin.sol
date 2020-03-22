// contracts/Coin.sol
pragma solidity ^0.6.0;

import "./ICoin.sol";
import "@openzeppelin/upgrades/contracts/Initializable.sol";

// Implements a basic coin structure that allows a central
// authority, called minter, to mint coins and allocate
// them to addresses.
contract Coin is ICoin, Initializable {
  // Central authority that owns the contract
  address public minter;

  // The addresses and their associated balances
  mapping (address => uint) private _balances;

  // The total supply that can be minted
  uint private _tokenSupply;

  // Sets the minter to the contract creator's address
  // during initilization of contract
  function initialize(uint tokenSupply) initializer public {
    require(tokenSupply > 0 && tokenSupply < 1e60, "Minimum Issuance Rate is too low!");
    minter = msg.sender;
    _tokenSupply = tokenSupply;
  }

  // This functions allows the ability to mint new coins
  // and allocate them to addresses
  function mint(address receiver, uint amount) external override  {
    require(msg.sender == minter);
    require(amount <= _tokenSupply, "The amount exceeds the token supply!");
    _balances[receiver] += amount;
    emit Minted(receiver, amount);
  }

  // This function sends an arbritary amount from the account of
  // transaction creator to a specified receiver
  function send(address receiver, uint amount) external override {
    require(_balances[msg.sender] >= amount, "Insufficient balance!");
    _balances[msg.sender] -= amount;
    _balances[receiver] += amount;
    emit Sent(msg.sender, receiver, amount);
  }

  // This function returns the balance associated with an `address`
  function balanceOf(address account) external override view returns (uint) {
    return _balances[account];
  }

  // This function returns the amount of tokens in existence.
  function tokenSupply() external override view returns (uint) {
    return _tokenSupply;
  }
}
