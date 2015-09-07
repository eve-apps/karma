#pgq = require("pg-query")
#credentials = require("../karmadb.coffee")
#query.connectionParameters = "postgres://karma_app_db:!@jjS234ffJ@localhost:5432/Karma"
#pg = require("pg")
express = require("/node_modules/express")
expressLogger = require("/node_modules/morgan")
alert "1"
connString = "postgres://karma_app_db:Jhnk870hh6hllfR45@localhost:5432/Karma"

client = pg.Client(connString)

client.connect()

alert "Yipeeeeee 1"


