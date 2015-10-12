debug.enable("karma:*")
d = debug("karma:client")
_ = lodash

Router.configure
  notFoundTemplate: "error"
  loadingTemplate: "loading"

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
