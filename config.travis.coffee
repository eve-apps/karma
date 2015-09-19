config =
  db:
    host: "localhost"
    name: "Karma"
    username: "postgres"
    password: ""
  testdb:
    host: "localhost"
    name: "travis_ci_test"
    username: "postgres"
    password: ""

config.db.connString = "postgres://#{config.db.username}:#{config.db.password}@#{config.db.host}/#{config.db.name}"
config.testdb.connString = "postgres://#{config.testdb.username}:#{config.testdb.password}@#{config.testdb.host}/#{config.testdb.name}"

module.exports = config
