debug = require("debug")("karma:routes")

module.exports = (app) ->
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
  return
