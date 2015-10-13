debug.enable("karma:*")
d = debug("karma:client")
_ = lodash

# counter starts at 0
Session.setDefault "counter", 0

Template.hello.helpers
  counter: ->
    return Session.get "counter"

Template.hello.events
  "click button": ->
    # increment the counter when button is clicked
    Session.set "counter", Session.get("counter") + 1
    d("Counter is now #{Session.get("counter")}")
    return
