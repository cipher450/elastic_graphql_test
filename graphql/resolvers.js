const esClient = require("../config/elasticsearch");

const resolvers = {
  Query: {
    searchBooks: async (_, { query }) => {
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
      return body.hits.hits.map((hit) => ({
        _id: hit._id,
        ...hit._source,
      }));
    },
    getAllBooks: async () => {
      const { body } = await esClient.search({
        index: "books",
        body: {
          size: 10000,
          query: {
            match_all: {},
          },
        },
      });
      return body.hits.hits.map((hit) => ({
        _id: hit._id,
        ...hit._source,
      }));
    },
  },
  Mutation: {
    addBook: async (_, { input }) => {
      const { title, authors, isbn, publication_date } = input;

      const newBook = {
        title,
        authors,
        isbn,
        publication_date,
      };

      
        const { body } = await esClient.index({
          index: "books",
          body: newBook,
        });

        return {
          _id: body._id,
          ...newBook,
        };
      
    },
  },
};

module.exports = resolvers;
