const express = require("express");
const router = require('./router').router
const {graphqlHTTP} = require('express-graphql')
const {makeExecutableSchema}= require('graphql-tools')
const app = express();
const PORT = 3000;

const fs = require("fs");
const path = require("path");

const typeDefs = fs.readFileSync(path.join(__dirname, "/graphql/schema.graphql"), "utf-8");
const resolvers = require("./graphql/resolvers");  

const schema = makeExecutableSchema({ typeDefs, resolvers });


app.use(express.json())
app.use(
  "/graphql",
  graphqlHTTP({
    schema,
    graphiql: true, 
  })
);
app.use('/api/',router)


//localhost:5601/api/console/proxy?path=_search&method=GET
app.get("/", (req, res) => {
  res.sendFile(__dirname + '/pages/elastique.html')
}); 
app.get("/gql", (req, res) => {
  res.sendFile(__dirname + '/pages/graphql.html')
});



app.get("/search", async (req, res) => {
  const { query } = req.query;

  const response = await fetch(
    `http://localhost:5601/api/console/proxy?path=_search&method=GET`,
    {
      headers: {
        "kbn-xsrf": "kibana", // Include the kbn-xsrf header
      },
      method: "POST",
      body: `
        {
            "query": {
              "match": {
                "title": "${query}"
              }
            }
          }
        `,
    }
  );
  const json = await response.json();
   
  res.json(json.hits.hits)
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
