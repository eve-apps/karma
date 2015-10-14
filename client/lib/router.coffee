##
# Auth
##

# Redirect to /home after logging in
Accounts.onLogin ->
  FlowRouter.go(FlowRouter.path("home"))
  return

# Make sure user is logged in when accessing the dashboard
requireAuth = (context, redirect) ->
  if not Meteor.userId() and not Meteor.loggingIn()
    redirect(FlowRouter.path("landing"))
  return

##
# Routes
##

exposed = FlowRouter.group {}
app = FlowRouter.group
  prefix: "/app"
  triggersEnter: [requireAuth]

exposed.route "/",
  name: "landing"
  action: ->
    BlazeLayout.render "landing"

app.route "/home",
  name: "home"
  action: ->
    BlazeLayout.render "dashboard",
      main: "home"
      side: "sidebar"

app.route "/industry",
  name: "industry"
  action: ->
    BlazeLayout.render "dashboard",
      main: "industry"
      side: "sidebar"

app.route "/meteortest",
  name: "meteortest"
  action: ->
    BlazeLayout.render "dashboard",
      main: "meteortest"
      side: "sidebar"

app.route "/refining",
  name: "refining"
  action: ->
    BlazeLayout.render "dashboard",
      main: "refining"
      side: "sidebar"
