debug.enable("karma:*")
d = debug("karma:client")
_ = lodash

Router.configure
  layoutTemplate: "simple"
  notFoundTemplate: "error"
  loadingTemplate: "loading"

Router.onAfterAction ->
  document.title = "Karma - #{@route.name or "Index"}"
