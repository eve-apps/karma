Router.route "/refining", ->
  @layout("dashboard")
  @render("refiningMain", {to: "main"})
