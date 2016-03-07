$ = require 'mongoose'

$.connect process.env.MONGO_URL

exports.module = $