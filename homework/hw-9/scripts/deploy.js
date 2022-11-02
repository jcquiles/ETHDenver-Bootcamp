async function main() {

    const VolcanoNFT = await hre.ethers.getContractFactory("VolcanoNFT");

    const myContractDeployed = await VolcanoNFT.deploy("VolcanoNFT", "MCNS");

    await myContractDeployed.deployed();

    console.log("Deployed VolcanoNFT to: ", myContractDeployed.address);

}

main()
     .then(() => process.exit(0))
     .catch((error) => {
        console.error(error);
        process.exit(1);
    });
