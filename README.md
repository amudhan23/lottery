
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

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/amudhan23/lottery.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```


<!-- USAGE EXAMPLES -->
## Usage

1. Running a test

   Few tests functions have been written for unit testing.
   To run
   ```sh
   truffle test
   ```

2. To deploy the contract
   * Create a .env file and provide the following details :
     Install NPM packages
        ```sh
        Mnemonic=<"your mnemonic">    
        InfuraKey="your infura key"
        ```
   * To deploy in the rinkeby testnetwork execute the following command :
       ```sh
       truffle deploy --reset --network rinkeby
       ```
