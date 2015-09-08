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

    rowData = refiningTable.row((rowIdx) ->
      return refiningTable.cell(rowIdx, 0).data() is itemName
    ).index()
    
    if rowData? # Found
      newData = refiningTable.cell(rowData, 1).data()
      refiningTable.cell(rowData, 1).data(newData + Quantity)
    else # Not found
      refiningTable.row.add([itemName, Quantity])

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
