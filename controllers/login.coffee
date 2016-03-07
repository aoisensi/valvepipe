models = require '../models'

User = models.User

exports.callback = (req, res) ->
  res.redirect '/welcome'

  
    