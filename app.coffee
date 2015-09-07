debug = require("debug")("karma:main")
debug("booting")
express = require("express")
expressLogger = require("morgan")
jade = require("jade")
pg = require("pg")
debug("dependencies loaded")

# Configure database connection
try
  credentials = require("./credentials.coffee")
  debug("credentials loaded")
catch
  debug("credentials file not found")
  process.exit 1
query = require("pg-query")
query.connectionParameters = credentials.db.connString
debug("database connection configured")

# Set server port
port = process.env.PORT or 80
# Initialize express app
app = express()
# Start express logger
app.use expressLogger("dev")
# Publish static content
app.use express.static(__dirname + "/public")
debug("express server configured")

# Configure Jade view engine
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

# Start listening on port
app.listen port, ->
  debug("listening on port #{port}")
  return
