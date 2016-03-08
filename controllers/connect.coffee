express = require 'express'
$ = do express.Router
passport = require '../passport'

utils = require './utils'

$.get '/twitter',
  utils.needLogin,
  passport.authenticate 'twitter',
    session: false
  
$.get '/twitter/callback',
  passport.authenticate 'twitter',
    session: false
    failureRedirect: '/connect/failed'
    successRedirect: '/pipe'
  
module.exports = $
