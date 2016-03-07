mongoose = require 'mongoose'

$ = new mongoose.Schema
    id: #steamid
      type: String
      unique: true
    name:
      type: String
    avatar:
      type: String
    connects:
      twitter:
        id: #twitter long id
          type: String
        screenName:
          type: String
        name:
          type: String
        avatar:
          type: String
        token:
          type: String
        tokenSecret:
          type: String
  ,
    timestamps:
      createdAt: 'createdAt'
      updatedAt: 'updatedAt'
      
$.method 'connectTwitter', (token, tokenSecret, profile, callback) ->
  user = @.model 'Users'
  user.connects.twitter = 
    id: '123456'
    screenName: 'aoisensi'
    name: 'hoge'
    avatar: 'url'
    token: token
    tokenSecret: tokenSecret
  
  user.save callback

$.static 'findById', (id, callback) ->
  @findOne id: id, null, callback

$.static 'immigration', (profile, callback) ->
  user = 
    id: profile._json.steamid
    name: profile._json.personaname
    avatar: profile._json.avatar
  @findOneAndUpdate
      id: user.id
    , user
    ,
      upsert: true
      'new': true
    , callback
  return

module.exports = mongoose.model 'Users', $