mongoose = require 'mongoose'

$ = new mongoose.Schema
    owner:
      type: mongoose.Schema.Types.ObjectId
      unique: true
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

$.static 'findByOwnerOId', (oid, callback) ->
  @findOne owner: oid, null, callback

module.exports = mongoose.model 'Twitters', $