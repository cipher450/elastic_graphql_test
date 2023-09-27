const express = require('express')
const elastic = require('./routes/elastic')

exports.router = (()=>{
    const Router = express.Router();

    Router.route('/elMatch').post(elastic.match)
    Router.route('/elAll').get(elastic.all)



    return Router

})();