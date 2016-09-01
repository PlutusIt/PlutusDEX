import "owned.sol";

contract PlutonDistribution is owned {
  struct EtherTransaction {
       bytes[4] tx;
       uint256 plutonAmount; //plutons*100000000000000000
   }

   struct BitcoinTransaction {
        bytes[4] tx;
        uint256 account;
        uint256 plutonAmount; //plutons*100000000000000000
    }

//EtherTransaction[1] etherTransactions = [EtherTransaction(hex"5487b714c0659731efaf9021e2ac161153e01b0259221f378a4202551af52695",1184207878095000)];
//BitcoinTransaction[695] bitcoinTransactions;

  function PlutonDistribution() {
  }

  function distributePlutons() onlyowner {
    // TODO
  }
}
