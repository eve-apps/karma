debug = require("debug")("karma:routes")
bodyParser = require("body-parser")
jsonParser = bodyParser.json()
urlencodedParser = bodyParser.urlencoded
  extended: true

module.exports = (app, pg, credentials) ->
  app.route "/"
    .get (req, res) ->
      debug("sending index page")
      res.render "index",
        title: "Index"
  app.route "/home"
    .get (req, res) ->
      debug("sending home page")
      res.render "home",
        title: "Home"
  app.route "/refining"
    .get (req, res) ->
      debug("sending refining page")
      res.render "refining",
        title: "Refining Yield",
        other: "other data"
      return
  app.route "/db"
    .post urlencodedParser, jsonParser, (req, res) ->
      if req.body.sql? and typeof req.body.sql is "string"
        debug("received db command: #{req.body.sql}")
        pg.connect credentials.db.connString, (err, client, done) ->
          if err
            debug("db command failed: #{err.message}")
            res.status(500).send err.message
            return
          client.query req.body.sql, (err, result) ->
            done()
            if err
              debug("db command failed: #{err.message}")
              res.status(500).send err.message
              return
            debug("db command executed")
            res.send result
            return
          return
      else
        debug("db command malformed")
        res.status(400).send "Malformed request"
      return
  return
