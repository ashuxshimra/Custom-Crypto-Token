// What does mint mean in NFT?
// “Minting” an NFT is, in more simple terms, uniquely publishing your token on the blockchain to make it purchasable. A simple step-by-step for starting this involves creating a digital wallet, specifically one that securely stores Cryptocurrency 
//The contract allows only the creator to create new coins 
//Anyone can send coins to each other without the need for registering with a username and password 
// SPDX-License-Identifier: MIT
pragma solidity^0.8;
contract Coin
{
address public minter;//that is the owner of the mart contract who will mint/create
//since coins has to be sent to the different addresses and accounts hence
//the keyword public it's making the variables
//here accessible from the other contracts
mapping (address=>uint) public balances;
//event is a inheritable member of a contract , when even is emitted, it stores the arguments passed in the parameters of emit. these logs are stored in blockchain and are accessible using address of the contract 
event Sent(address from, address to, uint amount);//this is an event created to trigger a transaction with these details in information bascially to have a sent information 

//constructor only runs when we deploy contract that is it defines the global variables made
constructor(){
minter=msg.sender;//this means that we are telling that msg.sender address who calls the contract is the owner
}
//now we need a function for mint where minting can be done
//only the owner can send these coins
// make new coins and send them to an address
function mint(address receiver, uint amount) public //mint function which basically enables only the owner to send the coins
{
//since u can send coins only if you are the creater/owner so 
require(msg.sender==minter); //that is the address of one who is calling this smart contract must be owner , if not then terminate
balances[receiver]+=amount; //that is of owner then u can send money hence at first now the balances of the reciver will be mapped with the entered amount

}
//now the above function was to make sure that the owner only sends the money to the receiver that is how you mint, that is how you make sure that you are the only one who can send money that is publishished
//now we need a specific send amount function which actually deals with sending amount specifically and addresses things like if the amount that is requested is more than the amount owner posseses 


//send any amount of coins
//to an existing address

error insufficientBalance(uint requested, uint available);
 //this is used to create an error using error and name of error with two parameters mentioned that is requested and available

function send(address receiver, uint amount) public //for anyone to send the coins that is not mint , we have this send function
{
if(amount > balances[msg.sender]) //if say the demanded amount is much more than the current balance then we use the keyword revert which basically stops the transaction 
revert insufficientBalance({  //inside the revert you have to define the objects from the parameters defined in the error made
    requested: amount , //the requested amount will be the amount that is entered 
    available: balances[msg.sender] //the avalable balance will obviousy be the of sender
});

 
balances[msg.sender]-=amount; //that is the entered amount from the sender or owner will be deducted
balances[receiver]+=amount; //the entered amount will be credited to the receiver
    emit Sent(msg.sender, receiver, amount); //invoking the event by passing values to it hence creating transactions and using emit
    

}
}
//the accounts in the deploy places mentioned are basically msg.sender accounts and say if first account selected and then deployed the acc to contract that selected account becomes the owner or minter as done in constructor hence , whatever amount has to be minted it should be done from this first selected account as keeping it selected and then copy other address wherecer u want to send the coins , if you keep a different account selected then no mint as once deployed the selcted is the minter and in minting only the owner can send the coins data
//however in send option of deployed contract u can send and recive coins from any account to any account
//now when you mint to say 2nd account with amount 10000 then now if you send using this 2nd account to any other account with amount greater than 10000 then it will revert as done in the code
//so this was our first sub crypto token created there are many other tokens as well such as ERC20, ERC725 study about them from openzepplin
//hence u have the mint option then send option with if condition then teiggering the transaction by emitting the event and showing sent status using it
//now say 10000 tokens are minted to say second account and now this second account has 10000 tokens hence for general purpose say this second account can use to pay his rent to third account and the amount you enter shall be less than 10000 as revert error will occur