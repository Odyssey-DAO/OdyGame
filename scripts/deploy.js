// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy

  // const Air = await hre.ethers.getContractFactory("Air");
  // const air = await Air.deploy();
  // await air.deployed();
  
  // const Fuel = await hre.ethers.getContractFactory("Fuel");
  // const fuel = await Fuel.deploy();
  // await fuel.deployed(); 

  // const Poll = await hre.ethers.getContractFactory("Poll");
  // const poll = await Poll.deploy(fuel.address);
  // await poll.deployed(); 

  const NFT = await hre.ethers.getContractFactory("OdysseyDAONFT");
  const NFT_ = await NFT.deploy();
  await NFT_.deployed(); 

  

  // console.log("AIR deployed to:", air.address);
  // console.log("FUEL deployed to:", fuel.address);
  console.log("NFT deployed to:", NFT_.address);
  // console.log("Poll deployed to:", poll.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
