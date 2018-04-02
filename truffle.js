module.exports = {
  build: {
    "index.html": "index.html",
    "app.js": [
      "javascripts/app.js"
    ],
    "app.css": [
      "stylesheets/app.css"
    ],
    "images/": "images/"
  },
  deploy: [
    "Pluton"
  ],
  rpc: {
    host: "localhost",
    port: 8545
  },
  networks: {
    "live": {
      network_id: 1, // Ethereum public network
      // optional config values
      // host - defaults to "localhost"
      // port - defaults to 8545
      // gas
      // gasPrice
      // from - default address to use for any transaction Truffle makes during migrations
    },
    "morden": {
      network_id: 2,        // Official Ethereum test network
    },
    "staging": {
      network_id: 927 // custom private network
      // use default rpc settings
    },
    "development": {
      network_id: "default"
    },
    "rinkeby": {
      host: "localhost",
      port: 8545,
      network_id: 4, // Rinkeby ID 4
      from: "0x078119aE5C89b061be8224404F8A25D7748575Cc", // account from which to deploy
      gas: 6712390
    }
  }
};
