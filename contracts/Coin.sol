// contracts/Coin.sol
pragma solidity ^0.6.0;

import "./ICoin.sol";

// Implements a basic coin structure that allows a central
// authority, called minter, to mint coins and allocate
// them to addresses.
contract Coin is ICoin {
  // Central authority that owns the contract
  address public minter;

  // The addresses and their associated balances
  mapping (address => uint) balances;

  // The minimum amount that can be minted
  uint private rate;

  // Sets the minter to the contract creator's address
  // during initilization of contract
  function initialize(uint _rate) public {
    require(_rate > 0, "Minimum Issuance Rate is too low!");
    minter = msg.sender;
    rate = _rate;
  }

  // This functions allows the ability to mint new coins
  // and allocate them to addresses
  function mint(address _receiver, uint _amount) external override  {
    require(msg.sender == minter);
    require(_amount >= rate);
    balances[_receiver] += _amount;
    emit Minted(_receiver, _amount);
  }

  // This function sends an arbritary amount from the account of
  // transaction creator to a specified receiver
  function send(address _receiver, uint _amount) external override  {
    require(balances[msg.sender] >= _amount, "Insufficient balance!");
    balances[msg.sender] -= _amount;
    balances[_receiver] += _amount;
    emit Sent(msg.sender, _receiver, _amount);
  }
}
