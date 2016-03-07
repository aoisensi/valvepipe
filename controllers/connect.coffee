models = require '../models'

User = models.User

exports.twitterCallback = (req, res) ->
  if(!req.session.twitter)
    res.status(500)
    return
  User.update {id: req.user.id}, req.user, {upsert: true}, (err) ->
    if(!err)
      res.redirect '/pipe'
      return
    console.log err
    
    