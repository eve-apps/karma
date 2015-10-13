debug.enable("karma:*")
d = debug("karma:client")
_ = lodash

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

Template.dashboard.onRendered ->
  $("#dashboard .ui.dropdown").dropdown()
  return

Template.dashboard.helpers
  currentCharName: ->
    return Meteor.user()?.profile.eveOnlineCharacterName
  currentCharId: ->
    return Meteor.user()?.profile.eveOnlineCharacterId

Template.dashboard.events
  "click .logout-button": ->
    Meteor.logout()
    return
