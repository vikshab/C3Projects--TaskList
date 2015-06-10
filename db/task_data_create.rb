require "sqlite3"

db = SQLite3::Database.new "task_data.db"

db.execute "CREATE TABLE tasks
  (id INTEGER PRIMARY KEY, task TEXT NOT NULL, description TEXT, completed_on TEXT);"

db.close if db
