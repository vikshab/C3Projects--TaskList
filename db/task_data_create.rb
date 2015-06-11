# this file is not called anywhere, and it should instead
# be run as part of the initial setup.

require "sqlite3"

db = SQLite3::Database.new "db/task_data.db"

db.execute "CREATE TABLE tasks(
  id INTEGER PRIMARY KEY,
  task TEXT NOT NULL,
  description TEXT,
  completed_on TEXT);"

db.close if db
