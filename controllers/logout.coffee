express = require 'express'
$ = do express.Router

$.get '/', (req, res) ->
  do req.logout
  res.redirect '/'
  
module.exports = $
