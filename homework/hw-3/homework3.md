## 1. Add a variable to hold the address of the deployer of the contract.

* `address deployer;`

## 2. Update the variable with the deployer's address when the contract is deployed.

* `constructor() {
    deployer = msg.sender;
}`

## 3. Write an external function to return

* Address 0x000000000000000000000000000000000000dEaD if called by the deployer
* The deployer's address otherwise

* `function getaddress () external view returns (address) {
    if (msg.sender == deployer) {
        return 0x000000000000000000000000000000000000dEaD;
} else {
  return deployer;
 }
}`