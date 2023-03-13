require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
// 填入自己的私钥或助记词，
const PRIVATE_KEY1 = "5757ac8ef2b49177411713e6fbc690cd5405a8fa78c9146f380db65e1a38b8c3";
const PRIVATE_KEY2 = "ae1ffeb5dcca3c5fed89d5db44f3f8071afd22bc501b1e1147164099bdd05a47";

module.exports = {
  solidity: "0.8.18",
  networks: {
    goerli: {
      url: "https://eth-goerli.api.onfinality.io/public",
      accounts: [PRIVATE_KEY1,PRIVATE_KEY2],
      chainId: 5,
    },
    
     mumbai: {
      url: "https://endpoints.omniatech.io/v1/matic/mumbai/public",
      accounts: [PRIVATE_KEY1,PRIVATE_KEY2],
      chainId: 80001,
    },
  }
};
