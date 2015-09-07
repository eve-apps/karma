debug = require("debug")("karma:main")
debug("booting")
express = require("express")
expressLogger = require("morgan")
jade = require("jade")
stylus = require("stylus")
nib = require("nib")
pg = require("pg")
query = require("pg-query")

connString = "postgres://karma_app_db:Jhnk870hh6hllfR45@localhost:5432/Karma"

port = process.env.PORT or 80
debug("dependencies loaded")
app = express()

# Enable express logger
app.use expressLogger("dev")

# Publish static content
app.use express.static(__dirname + "/public")

# Use Jade as view engine
app.set("views", __dirname + "/views")
app.set("view engine", "jade")
debug("view engine configured")

# Configure routes
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
app.route "/refine"
  .get (req, res) ->
    debug("sending refining page")
    res.render "refining",
      title: "Refining Yield",
      other: "other data"
    return
debug("routes configured")

# Start listening
app.listen port, ->
  debug("listening on port #{port}")
  return
