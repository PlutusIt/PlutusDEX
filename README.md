# Plutus
This repository will contain the source code that constitutes each component of Plutus Decentralized Exchange Network utilizing Ethereum.
For more information see (https://plutus.it/) and the Plutus white paper (https://plutus.it/assets/Plutus.it-White-Paper-v1.0.pdf).
## PlutusDEX
The main source code of the Plutus Decentralized Exchange Network (PlutusDEX - https://dex.plutus.it) written in Solidity (https://solidity.readthedocs.org/en/latest/).
Stores data associated with trades and regulates the trade of fiat currency for Bitcoin or Pluton. Matches Plutus Mobile App users to traders with the best price.
## Plutons
Tokens implemented on the Ethereum blockchain. Used to reward users for making purchases on the Plutus Mobile App.
Uses the standardized Ethereum API and is based on the example: https://github.com/ethereum/dapp-bin/blob/master/standardized_contract_apis/currency.sol
## Issuer
Regulates user rebate rewards and issues Plutons to users accordingly.
## Plutus User
Stores all data associated with a single user. Allows the user to send Plutons and to interact with traders via PlutusDEX.
### Trader
Registers a trader with Plutus so they can begin using PlutusDEX.



# Development

## Installation
* Install truffle. See http://truffle.readthedocs.org/en/latest/getting_started/client/
* Install ethereum testrpc https://github.com/ethereumjs/testrpc
* Install bitcoin testnet https://github.com/freewil/bitcoin-testnet-box. Using docker:
** https://github.com/freewil/bitcoin-testnet-box#using-with-docker
** remark: http://testnetwallet.com/wallet looks nice, but haven't used it yet

## Doing Development
* Run ethereum testnet by executing `testrpc`
* Run bitcoin testnet executing `docker run -t -i freewil/bitcoin-testnet-box`
* Run `truffle compile` to compile contracts in contracts dir
