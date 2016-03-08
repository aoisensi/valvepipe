express = require 'express'
$ = do express.Router
passport = require '../passport'

$.get '/', passport.authenticate 'steam'

$.get '/callback',
  passport.authenticate 'steam',
    failureRedirect: '/login/failed',
    successRedirect: '/welcome'
  
module.exports = $
