const { expect } = require('chai');

describe("VolcanoNFT", function(){

   it("should return correct name", async function () {

       const VolcanoNFT = await hre.ethers.getContractFactory("VolcanoNFT");

       const myContractDeployed = await VolcanoNFT.deploy("MyVolcanoNFT", "MCN");

       await myContractDeployed.deployed();

       expect(await myContractDeployed.name()).to.equal("MyVolcanoNFT");

   });

});