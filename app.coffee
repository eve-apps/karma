debug = require("debug")("karma:main")
debug("booting")
express = require("express")
expressLogger = require("morgan")
jade = require("jade")
stylus = require("stylus")
nib = require("nib")
pg = require("pg")
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
    debug("sending \"Hello, world!\"")
    return res.send "Hello, world!"
debug("routes configured")

# Start listening
app.listen port, ->
  debug("listening on port #{port}")
  return
