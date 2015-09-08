#query = require("pg-query")




#oreList = query("select itemName from Ore order by itemName", (err, rows, result) ->
#	alert rows )


#alert oreList
#alert "3333"
refiningTable = null
refineMe = []
#accepts optional array of values as 2nd parameter for parameterized queries

AddNewRefiningElement = ->
  Quantity = parseInt($("#inputQuantity").val(), 10)
  unless isNaN(Quantity)
    itemName = $("#oreInput1").val()
    itemRow = refiningTable.column(0).data().indexOf(itemName)

    if itemRow < 0 # Not found
      refiningTable.row.add([itemName, Quantity])
    else # Found
      itemCell = refiningTable.cell(itemRow, 1) # Selects the right cell
      dat = itemCell.data() # Pulls data from a different cell? wtf?!
      itemCell.data(dat + Quantity)
    refiningTable.draw()
  return

$ ->
  refiningTable = $("#refiningSource").DataTable
    "paging": false
    "searching": false
    columns: [
      { title: "Ore" }
      { title: "Quantity" }
    ]
  $(".select2").select2()
  #- $(oreList).each(function() {
  #- var opt = document.createElement("option");
  #- opt.innerHTML = this;
  #- $("#oreInput1").appendChild(opt);});

  $("#addButton").on("click", AddNewRefiningElement)
  return
