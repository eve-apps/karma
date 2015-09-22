# Start logging
debug = require("debug")("karma:server")
debug("Booting")

# Load dependencies
express = require("express")
path = require("path")
favicon = require("serve-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
debug("Dependencies loaded")

# Initialize express app
app = express()
debug("Express app initialized")

# View engine configuration
app.set("views", path.join(__dirname, "./views"))
app.set("view engine", "jade")
debug("View engine configured")

# Configure favicon
app.use favicon(path.join(__dirname, "./public", "favicon.ico"))
debug("Favicon configured")
# Enable express logger
app.use logger("dev")
debug("Express logger enabled")
# Enable body parser
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
debug("Body parser enabled")
# Enable cookie parser
app.use cookieParser()
debug("Cookie parser enabled")
# Publish static content
app.use express.static(path.join(__dirname, "./public"))
debug("Static content published")

# Configure routes
app.use "/", require("./routes/index")
app.use "/home", require("./routes/home")
app.use "/refining", require("./routes/refining")
app.use "/db", require("./routes/db")
debug("Routes configured")

# Catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  err.description = "The requested resource could not be found"
  next(err)
  return

# Error handlers
if app.get("env") is "development"
  # Development error handler
  # Will print stacktrace
  ansi_up = require("ansi_up")
  app.use (err, req, res, next) ->
    err.status = err.status or 500
    res.status err.status
    err.stack = ansi_up.ansi_to_html(err.stack).replace(/color:rgb\(85, 85, 85\)/gi, "color:rgb(150, 150, 150)")
    res.render "error",
      message: err.message
      error: err
    return
else
  # Production error handler
  # No stacktraces leaked to user
  app.use (err, req, res) ->
    err.status = err.status or 500
    res.status err.status
    res.render "error",
      message: err.message
      error:
        status: err.status
        description: err.description
    return
debug("Error handlers configured")

module.exports = app
