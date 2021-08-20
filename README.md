
<!-- ABOUT THE PROJECT -->
## About The Project

The project is about creating a lottery solidity code.
Following are the few key features :
* The owner of the contract is the deployer.
* The first token goes to the owner.
* Users can buy any number of tokens depending upon the availability.
* Winner is decided upon calling a fn by the owner when all the tokens are sold.

### Built With

* Truffle
* Infura
* NPM



<!-- GETTING STARTED -->
## Getting Started


### Prerequisites


* npm needs to be installed.
  ```sh
  npm install npm@latest -g
  ```

### Installation


1. Clone the repo
   ```sh
   git clone https://github.com/amudhan23/lottery.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```


<!-- USAGE EXAMPLES -->
## Usage

1. To compile
   ```sh
    truffle compile
    ```
2. To deploy in the local network
    * Connect to ganache with the appropriate host and port details.
    * Run the command :
      ```sh
       truffle deploy
       ```

2. Running test

   Few tests functions have been written for unit testing.
   To run:
   ```sh
   truffle test
   ```

3. To deploy in test network
   * Create a .env file and provide the following details :
        ```sh
        Mnemonic=<"your mnemonic">    
        InfuraKey=<"your infura key">
        ```
   * To deploy in the rinkeby testnetwork execute the following command :
       ```sh
       truffle deploy --reset --network rinkeby
       ```


## Deployed contract
   The contract has been already deployed in rinkeby testnet and verified.
   Address : 0x4334E1dAD14CC38043e5d17B7445fbbb654b19E4
