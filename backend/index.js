const express = require("express");
const {graphqlHTTP} = require('express-graphql')
const {makeExecutableSchema}= require('graphql-tools')
const app = express();
const PORT = 3000;
const cors = require("cors");
const fs = require("fs");
const path = require("path");

const typeDefs = fs.readFileSync(path.join(__dirname, "/graphql/schema.graphql"), "utf-8");
const resolvers = require("./graphql/resolvers");  
 
const schema = makeExecutableSchema({ typeDefs, resolvers });

app.use(cors({ origin: 'http://localhost:8080' }));
app.use(express.json())
app.use(
  "/graphql",
  graphqlHTTP({
    schema,
    graphiql: true, 
  })
);
app.get("/",  (req, res) => {
  res.send('OK')
  
   
}); 


app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
