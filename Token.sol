// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Token {
  mapping(address => uint) public balances;
  mapping(address => mapping(address => uint)) public allowance;
  uint public totalSupply = 10000;
  string public name = "Loken";
  string public symbol = "LKN";
  uint public decimals = 18;
 
event Transfer(address indexed from, address indexed to, uint value );

constructor() {
  balances[msg.sender] = totalSupply;
}

function balanceOf(address owner) public view returns(uint){
  return balances[owner];
}

// function to transfer tokens

function transfer(address to, uint value) public returns(bool){
  require(balanceOf(msg.sender) >= value, 'balance not enough');
  balances[to] += value;
  balances[msg.sender] -= value;
  emit Transfer(msg.sender, to, value);
  return true;
}

//Giving an address authority / approval to spend funds 
function approve(address spender, uint value) public returns(bool){
  allowance[msg.sender][spender] = value;
}

}