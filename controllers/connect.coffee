express = require 'express'
$ = do express.Router
passport = require '../passport'

utils = require './utils'

$.get '/', utils.needLogin, (req, res) ->
  console.log req.user
  res.render 'connect', { user: req.user }

$.get '/twitter',
  utils.needLogin,
  passport.authenticate 'twitter',
    session: false
  
$.get '/twitter/callback',
  passport.authenticate 'twitter',
    session: false
    failureRedirect: '/connect/failed'
    successRedirect: '/pipe'
    
$.get '/twitter/unlink', (req, res) ->
  user = req.user
  user.update
      $set:
        connects:
          twitter: null
    , {}
    , (err, raw) ->
      unless err
        res.redirect '/pipe'
        return
      res.status '500'
        .response 'error'
    
  
  
module.exports = $
