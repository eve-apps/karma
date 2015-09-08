#oreList = query("select itemName from Ore order by itemName", (err, rows, result) ->
#	alert rows )


#alert oreList
#alert "3333"
refiningTable = null

UpdateRefiningTable = ->
  quantity = parseInt($("#inputQuantity").val(), 10)
  unless isNaN(quantity)
    itemName = $("#oreInput1").val()

    oreRowID = refiningTable.row((rowID) ->
      return refiningTable.cell(rowID, 0).data() is itemName
    ).index()
    
    if oreRowID? # Found
      oreCell = refiningTable.cell(oreRowID, 1)
      oreCell.data(oreCell.data() + quantity)
    else # Not found
      refiningTable.row.add([itemName, quantity])

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

  $("#addButton").on("click", UpdateRefiningTable)
  return
