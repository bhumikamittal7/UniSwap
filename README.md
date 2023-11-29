## Steps

Run the following commands in the terminal to setup the project:

```bash
sudo apt install nodejs
npm install --save-dev hardhat
npm install --save-dev @nomiclabs/hardhat-ethers ethers
npm install --save-dev @openzeppelin/contracts
```

To run the project:

```bash
npx hardhat node
npx hardhat run --network localhost scripts/deploy_token.js
npx hardhat run --network localhost scripts/deploy_exchange.js

```

Add the token_address.txt into the address tokenAddr field in contracts/exchange.sol
Update the contract address and ABI in web_app/exchange.js. Update the const token_address and const exchange_address variables with the two contract addresses.
The ABIs can be copied from artifacts/contracts/token.sol/token.json and artifacts/contracts/exchange.sol/exchange.json.

The following commands can be used to run the web app:

```bash
https://localhost:8545
```