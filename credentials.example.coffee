credentials =
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

credentials.db.connString = "postgres://#{credentials.db.username}:#{credentials.db.password}@#{credentials.db.host}/#{credentials.db.name}"
credentials.testdb.connString = "postgres://#{credentials.testdb.username}:#{credentials.testdb.password}@#{credentials.testdb.host}/#{credentials.testdb.name}"

module.exports = credentials
