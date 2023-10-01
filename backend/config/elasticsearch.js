const { Client } = require("@elastic/elasticsearch");

const esClient = new Client({
  node: "http://localhost:9200",
  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",
  },
});

module.exports = esClient;
