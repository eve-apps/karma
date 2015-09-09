debug = require("debug")("karma:router")
express = require("express")
router = express.Router()

# GET refining page

router.get "/", (req, res, next) ->
  debug("Sending refining page")
  res.render "refining",
    title: "Refining Yield"
  return

# CATCH-ALL refining page

router.all "/", (req, res, next) ->
  debug("Client used unsupported #{req.method} method")
  err = new Error("#{req.method} not supported")
  err.status = 405
  err.description = "Request method not supported by that resource"
  next(err)
  return

module.exports = router
