const esClient = require("../config/elasticsearch");
const resolvers = {
  Query: {
    getProductByName: async (_, args) => {
      const { product_name } = args;
      const { body } = await esClient.search({
        index: "amazon",
        body: {
          query: {
            wildcard: {
              product_name: product_name + "*",
            },
          },
        },
      });
      return body.hits.hits.map((hit) => {
        const {
          _source: {
            product_id,
            product_name,
            description,
            price,
            quantity,
            is_available,
            date_added,
          },
        } = hit;

        return {
          product_id,
          product_name,
          description,
          price,
          quantity,
          is_available,
          date_added,
        };
      });
    },
    getAllProducts: async () => {
      const { body } = await esClient.search({
        index: "amazon",
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

    filtreProducts: async (
      _,
      {
        searchTerm,
        minPrice,
        maxPrice,
        minQuantity,
        maxQuantity,
        page,
        pageSize,
        isAvailable,
      }
    ) => {
      const query = {
        bool: {
          must: [],
        },
      };

      if (searchTerm) {
        query.bool.must.push({ match: { product_name: searchTerm } });
      }

      if (minPrice) {
        query.bool.must.push({ range: { price: { gte: minPrice } } });
      }

      if (maxPrice) {
        query.bool.must.push({ range: { price: { lte: maxPrice } } });
      }

      if (minQuantity) {
        query.bool.must.push({ range: { quantity: { gte: minQuantity } } });
      }

      if (maxQuantity) {
        query.bool.must.push({ range: { quantity: { lte: maxQuantity } } });
      }

      if (isAvailable !== undefined) {
        query.bool.must.push({ term: { is_available: isAvailable } });
      }

      const filtre = {
        // from: (page - 1) * pageSize,
        size: pageSize,
        query,
      };

      console.log(JSON.stringify(filtre));

      const { body } = await esClient.search({
        index: "amazon",
        body: filtre,
      });

      console.log(body);

      return body.hits.hits.map((hit) => {
        const {
          _source: {
            product_id,
            product_name,
            description,
            price,
            quantity,
            is_available,
            date_added,
          },
        } = hit;

        return {
          product_id,
          product_name,
          description,
          price,
          quantity,
          is_available,
          date_added,
        };
      });
    },
  },
  Mutation: {
    addProduct: async (_, { productInput }) => {
      const { body } = await esClient.index({
        index: "amazon",
        body: productInput,
      });
      return { _id: body._id, ...productInput };
    },
    updateProduct: async (_, { product_id, productInput }) => {
      const { body } = await esClient.update({
        index: "amazon",
        id: product_id,
        body: {
          doc: productInput,
        },
      });
      return { _id: body._id, ...productInput };
    },
  },
};

module.exports = resolvers;
