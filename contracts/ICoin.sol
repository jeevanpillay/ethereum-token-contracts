// contracts/ICoin.sol
pragma solidity ^0.6.0;

// This implementation serves as the standard interface for a Coin.
// It has very limited functionality which only for the representation and
// testing of practicality of sending and minting Coin's on Solidity.
interface ICoin {
  // This is the interface of the function to sends an arbritary amount
  // from the account of transaction creator to a specified receiver.
  function send(address receiver, uint amount) external;

  // This is the interface of the function that allows the ability to
  // mint new coins and allocate them to addresses.
  function mint(address receiver, uint amount) external;

  // Emitted when an `amount` allocated from one address to another.
  event Sent(address from, address to, uint amount);

  // Emitted when an `amount` is minted by the central authority for reciever
  event Minted(address receiver, uint amount);
}
