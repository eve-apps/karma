Router.route "/industry", ->
  @layout("dashboard")
  @render("industryMain", {to: "main"})
