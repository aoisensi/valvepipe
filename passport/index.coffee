$ = require 'passport'

$.use require './steam'
$.use require './twitter'

User = require '../models/user'

$.serializeUser (user, done) ->
  done null, user.id

$.deserializeUser (id, done) ->
  User.findById id, done

module.exports = $