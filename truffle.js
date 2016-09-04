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
  }
}
};
