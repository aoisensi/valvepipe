express = require 'express'
$ = do express.Router

$.get '/pipe', (req, res) ->
  res.render 'pipe', { user: req.user }
  
exports.module = $
