exports.needLogin = (req, res, next) ->
  unless req.user
    res.status 401
      .send 'need login'
    return
  do next