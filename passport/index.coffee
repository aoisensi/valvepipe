$ = require 'passport'

$.use require './steam'
$.use require './twitter'

User = require '../models/user'

$.serializeUser (user, done) ->
  console.log 'serialize'
  done null, user.id

$.deserializeUser (id, done) ->
  console.log 'deserialize'
  User.findById id, done

module.exports = $