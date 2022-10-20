## 1. Add a variable to hold the address of the deployer of the contract.

* `address deployer;`

# 2. Update the variable with the deployer's address when the contract is deployed.

* `constructor() {
    deployer = msg.sender;
}`