# Plutus
This repository will contain the smart contracts that underline Distrubuted EXchange of Plutus.
For more information see (https://plutus.it/) and the soon to be released whitepaper.
## Plutus-dex
Plutus-DistributedEXchange. Smart contract. Written in Solidity. https://solidity.readthedocs.org/en/latest/
Holds information on all open offers to trade fiat currency for Bitcoin or Pluton. Matches offers in of bitcoin or pluton done by plutus app users.
## Plutons
Subcurrency implemented on Ethereum. Used to reward users for using Plutons, and during the crowd-sale.
Using standardized api, based on currency example (https://github.com/ethereum/dapp-bin/blob/master/standardized_contract_apis/currency.sol)
## Issuer
Issues new plutons to reward them to users.
## Smart contract representing user
For each trader and plutus user a contract will be instantiated, rather than having one contract holding all traders. Via their own contract the trader and user can interact with Plutus.
For flexibility the logic in the user contract will contain little logic, logic is encapsulated by other smart contracts that are called from the user contract. Note: because the user is owner of his or her contract, the user is in control on what other smart contracts are called.
### Trader
Represents one trader.
### User
Represents one user.
