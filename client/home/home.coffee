Router.route "/home", ->
  @layout("dashboard")
  @render("homeMain", {to: "main"})
