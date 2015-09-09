debug = require("debug")("karma:router")
express = require("express")
router = express.Router()
pg = require("pg")

# Load database connection config
try
  config = require("../config")
  debug("Config loaded")
catch
  debug("Config file not found")
  process.exit 1

# POST db command

router.post "/", (req, res, next) ->
  debug("Received DB command")
  if req.body.sql? and typeof req.body.sql is "string"
    debug("#{req.body.sql}")
    pg.connect config.db.connString, (err, client, done) ->
      if err
        debug("DB command failed: #{err.message}")
        err.status = 500
        err.description = "DB command failed"
        next(err)
        return
      client.query req.body.sql, (err, result) ->
        done()
        if err
          debug("DB command failed: #{err.message}")
          err.status = 500
          err.description = "DB command failed"
          next(err)
          return
        debug("DB command executed")
        res.send result
        return
      return
  else
    debug("DB command malformed")
    err = new Error("Malformed request")
    err.status = 400
    err.description = "sql key must exist and its value must be a valid SQL string"
    next(err)
  return

# CATCH-ALL db command

router.all "/", (req, res, next) ->
  debug("Client used unsupported #{req.method} method")
  err = new Error("#{req.method} not supported")
  err.status = 405
  err.description = "Request method not supported by that resource"
  next(err)
  return

module.exports = router
