Router.route "/", ->
  @layout("simple")
  @render("landingMain", {to: "main"})
  return
