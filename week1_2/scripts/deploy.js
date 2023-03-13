const { ethers } = require("hardhat");

async function main() {

   const Counter = await ethers.getContractFactory("Counter");
   const counter = await Counter.deploy(0);
   await counter.deployed();

  console.log("Counter address:", counter.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});