require("dotenv").config();

require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("solidity-coverage");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    ropsten: {
      url: process.env.ROPSTEN_URL || "",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    goerli: {
      url: process.env.GOERLI_URL || "",
      accounts:
        [process.env.PRIVATE_KEY]
    }, 
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
  utils: {
    interact: async function (abi, contAddress, network, account) {
      if (account == undefined) account = (await hre.ethers.getSigner()).address;
      const provider = new ethers.providers.JsonRpcProvider(network.url);
      const signer = provider.getSigner(account);
      const contract = new ethers.Contract(contAddress, abi, signer);
      return {
        provider, signer, contract
      };
    },
    interactLocal: async function (name, contAddress) {
      let Contract = await hre.ethers.getContractFactory(name);
      let contract = await Contract.attach(contAddress);
      return {
        contract,
      };
    },
  }
};
