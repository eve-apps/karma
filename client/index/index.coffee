Router.route "/", ->
  @layout("simple")
  @render("indexMain", {to: "main"})
