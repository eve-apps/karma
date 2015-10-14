debug.enable("karma:*")
d = debug("karma:client")
_ = lodash

##
# Templates
##

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
    Meteor.logout ->
      FlowRouter.go(FlowRouter.path("landing"))
      return
    return
