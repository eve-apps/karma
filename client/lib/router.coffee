##
# Globals
##

Router.configure
  notFoundTemplate: "error"
  loadingTemplate: "loading"

# Redirect to /home after logging in
Accounts.onLogin ->
  Router.go("/home")
  return

# Make sure user is logged in when accessing the dashboard
Router.onBeforeAction (->
  if not Meteor.userId() and not Meteor.loggingIn() then Router.go("/")
  @next()
  return
), except: ["/"]

Router.onAfterAction ->
  document.title = "Karma - #{@route.name or "Index"}"
  return

##
# Routes
##

Router.route "/", ->
  @render("landing")
  return

Router.route "/home", ->
  @layout("dashboard")
  @render("homeMain", {to: "main"})
  return

Router.route "/industry", ->
  @layout("dashboard")
  @render("industryMain", {to: "main"})
  return

Router.route "/meteortest", ->
  @layout("dashboard")
  @render("meteortestMain", {to: "main"})
  return

Router.route "/refining", ->
  @layout("dashboard")
  @render("refiningMain", {to: "main"})
  return
