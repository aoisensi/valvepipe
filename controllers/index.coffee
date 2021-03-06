express = require 'express'
$ = do express.Router

$.get '/', (req, res) ->
  res.render 'index', {user: req.user}
  
$.use '/login', require './login'
$.use '/connect', require './connect'
$.use '/logout', require './logout'

$.get '/welcome', (req, res) ->
  res.render 'welcome', { user: req.user }

module.exports = $