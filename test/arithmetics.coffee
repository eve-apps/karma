expect = require("expect.js")

describe "arithmetics", ->
  it "should add 1+1 correctly", (done) ->
    expect(1 + 1).to.be 2
    done()
    return
  it "should subtract 1-1 correctly", (done) ->
    expect(1 - 1).to.be 0
    done()
    return
  it "should multiply 1*1 correctly", (done) ->
    expect(1 * 1).to.be 1
    done()
    return
  it "should divide 1/1 correctly", (done) ->
    expect(1 / 1).to.be 1
    done()
    return
  return
