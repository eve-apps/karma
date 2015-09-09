debug = require("debug")("karma:router")
express = require("express")
router = express.Router()

# GET index page

router.get "/", (req, res, next) ->
  debug("Sending index page")
  res.render "index",
    title: "Index"
  return

# CATCH-ALL index page

router.all "/", (req, res, next) ->
  debug("Client used unsupported #{req.method} method")
  err = new Error("#{req.method} not supported")
  err.status = 405
  err.description = "Request method not supported by that resource"
  next(err)
  return

module.exports = router
