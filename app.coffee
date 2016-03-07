express = require 'express'
session = require 'express-session'
$ = do express

db = require './db'

routes = require './routes'
passport = require './passport'

$.set 'view engine', 'jade'
$.set 'views', __dirname + '/views'

$.use express.static 'public'

$.use session secret: process.env.SESSION_SECRET || 'crystalmaiden'
    
$.use do passport.initialize
$.use do passport.session
$.use routes

$.listen process.env.PORT, process.env.IP