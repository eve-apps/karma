expect = require("expect.js")
query = require("pg-query")
config = require("../config.coffee")
query.connectionParameters = config.testdb.connString

describe "database", ->
  before (done) ->
    query("DROP TABLE IF EXISTS test")
    query("CREATE TABLE IF NOT EXISTS test (name text not null)", done)
    return

  it "should do database stuff", (done) ->
    query "SELECT $1::int AS number", ["1"], (err, rows, result) ->
      expect(rows).to.have.length(1)
      expect(rows[0]).to.be.an("object")
      expect(rows[0]).to.have.property("number", 1)
      done(err)
    return
  it "should do other database stuff too", (done) ->
    query "SELECT $1::int AS number", ["2"], (err, rows, result) ->
      expect(rows).to.have.length(1)
      expect(rows[0]).to.be.an("object")
      expect(rows[0]).to.have.property("number", 2)
      done(err)
    return
  return
