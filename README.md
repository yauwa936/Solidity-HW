# Solidity-Homework
# ```(Level 1) AssociateProfitSplitter```
![Image](https://github.com/yauwa936/Solidity-HW/blob/main/Screenshots/Code.PNG?raw=true)

In this solidity contract, we created three public variable and they act as employee addresses.
After we created a constructor function that accepts ```
address payable _one, _two, _three```

The balace function is just to return the contract's currect balance.

deposit function - we set this as ```public payable``` to ensure only the owner can call this function, following step by step:
 - set amount as uint, this will equal to ```msg.value / 3```, because we want to transfer funds equally to three employee.
 - Then we do ```transfer.(amount)``` to each employee.
 - ```msg.sender.transfer(msg.value - amount * 3)``` because there will be few wei left from the above transaction.

Finally, we make a fallback function to call the ```deposit()``` function.

# Let's test the contract now
### ```Compile then Deploy !```
![Image](https://github.com/yauwa936/Solidity-HW/blob/main/Screenshots/deploy.PNG?raw=true)

Following steps:
 - Compile the contract and then we switch environment to ```Injected Web3```, you will be able to see ```Custom(5777)network``` below which means it is connected to localhost. The Account would automatically change to your current metamask wallet which is connected to the localhost.
 - Value set at 0 first.
 - Put the employee addresses, click transact !
Magic ! The smart contract is so smart that is deployed!

![Image](https://github.com/yauwa936/Solidity-HW/blob/main/Screenshots/runcontract.PNG?raw=true)

Scroll down to ```Deployed Contract``` and you will be able to see the contract. Now we can scroll back up to ```VALUE``` and type in the amount you would like to transfer to the employee. After that, just click ```deposit```
```
NICELY DONE !
```

### ```Go back to Ganache and you will be able to see te contract call and creation in details```
![Image](https://github.com/yauwa936/Solidity-HW/blob/main/Screenshots/contractcalls.PNG?raw=true)