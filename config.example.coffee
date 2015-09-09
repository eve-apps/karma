config =
  db:
    host: "localhost"
    name: "Karma"
    username: "karma_app_db"
    password: "password"
  testdb:
    host: "localhost"
    name: "test"
    username: "karma_app_db"
    password: "password"

config.db.connString = "postgres://#{config.db.username}:#{config.db.password}@#{config.db.host}/#{config.db.name}"
config.testdb.connString = "postgres://#{config.testdb.username}:#{config.testdb.password}@#{config.testdb.host}/#{config.testdb.name}"

module.exports = config
