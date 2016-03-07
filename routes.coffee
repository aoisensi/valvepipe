express = require 'express'
$ = do express.Router

compose = require 'composable-middleware'

passport = require './passport'

controllers = require './controllers'

needLogin = (req, res, next) ->
  unless req.user
    res.status 401
      .send 'need login'
    return
  do next

$.get '/', (req, res) ->
  res.render 'index', {user: req.user}
  
$.get '/login', passport.authenticate 'steam'

$.get '/login/callback', 
  passport.authenticate 'steam',
    failureRedirect: '/login/failed',
  controllers.login.callback
  
$.get '/logout', (req, res) ->
  do req.logout
  res.redirect '/'
  
$.get '/pipe', (req, res) ->
  res.render 'pipe', { user: req.user }
  
$.get '/connect/twitter',
  needLogin,
  passport.authenticate 'twitter', {session: false}
  
$.get '/connect/twitter/callback',
  passport.authenticate('twitter', {session: false, failureRedirect: '/connect/failed', successRedirect: '/pipe'})
$.get '/welcome', (req, res) ->
  res.render 'welcome', { user: req.user }
  



module.exports = $