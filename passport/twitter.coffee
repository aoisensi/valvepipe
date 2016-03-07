TwitterStrategy = require('passport-twitter').Strategy

User = require '../models/user'

$ = new TwitterStrategy
    consumerKey: process.env.TWITTER_CONSUMER_KEY
    consumerSecret: process.env.TWITTER_CONSUMER_SECRET
    callbackURL: process.env.ROOT_URL + '/connect/twitter/callback'
    passReqToCallback : true
  ,
    (req, token, tokenSecret, profile, done) ->
      user = req.user
      unless user
        done 'not yet login', null
        return
      json = profile._json
      user.update 
          $set:
            connects:
              twitter:
                id: json.id_str
                screenName: json.screen_name
                name: json.name
                avatar: json.profile_image_url
                token: token
                tokenSecret: tokenSecret
        , {}
        , (err, raw) ->
            done err, user

module.exports = $