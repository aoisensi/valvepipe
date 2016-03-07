SteamStrategy = require('passport-steam').Strategy

User = require '../models/user'

$ = new SteamStrategy
    returnURL: process.env.ROOT_URL + '/login/callback'
    realm: process.env.ROOT_URL
    apiKey: process.env.STEAM_API_KEY,
    (identifier, profile, done) ->
      User.immigration profile, done
          

module.exports = $