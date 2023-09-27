const esClient = require("../config/elasticsearch");

module.exports = {
  match: async (req, res) => {
    const { query } = req.body;

    const { body } = await esClient.search({
      index: "books",

      body: {
        query: {
          match: {
            title: query,
          },
        },
      },
    });
    res.json(body.hits.hits);
  },
  all: async (req, res) => {
    const { body } = await esClient.search({
      index: "books",

      body: {
        size: 10000,
        query: {
          match_all: {},
        },
      },
    });

    res.json(body.hits.hits);
  },
};
