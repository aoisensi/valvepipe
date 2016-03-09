express = require 'express'
session = require 'express-session'
$ = do express

db = require './db'

passport = require './passport'

$.set 'view engine', 'jade'
$.set 'views', __dirname + '/views'

$.use express.static 'public'

$.use session
  secret: process.env.SESSION_SECRET || 'crystalmaiden'
  saveUninitialized :false
  resave: false
  
    
$.use do passport.initialize
$.use do passport.session

$.use '/', require './controllers'

$.listen process.env.PORT, process.env.IP