#query = require("pg-query")




#oreList = query("select itemName from Ore order by itemName", (err, rows, result) ->
#	alert rows )


#alert oreList
#alert "3333"

refineMe = []
#accepts optional array of values as 2nd parameter for parameterized queries

AddNewRefiningElement = ->
  itemName = document.getElementById("oreInput1").value
  Quantity = document.getElementById("inputQuantity").value
  found = false
  i = 0
  while i < refineMe.length
    if refineMe[i][0] == itemName
      found = true
      old = eval(refineMe[i][1])
      old += eval(Quantity)
      refineMe[i][1] = old
    i++
  t = $("#refiningSource").DataTable()
  if !found
    row = new Array
    row.push itemName
    row.push Quantity
    refineMe.push row
    #-t.row.add(row);
  t.clear()
  $(refineMe).each ->
    t.row.add this
    return
  t.draw()
  return

$(document).ready ->
  $("#refiningSource").DataTable
    "paging": false
    "searching": false
    data: refineMe
    columns: [
      { title: "Ore" }
      { title: "Quantity" }
    ]
  $(".select2").select2()
  #- $(oreList).each(function() {
  #- var opt = document.createElement("option");
  #- opt.innerHTML = this;
  #- $("#oreInput1").appendChild(opt);});
  return
