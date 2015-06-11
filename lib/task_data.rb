require 'sqlite3'
require_relative './database'

module TaskList
  class TaskData < Database
  ####   attr_reader :database_name

  ####   def initialize(database_name)
  ####     @database_path = "db/#{ database_name }"
  ####   end

  def add_task(task, description)
    query!("INSERT INTO tasks (task, description) VALUES (?, ?);", task, description)
  end

  def display_list
    query!("SELECT * FROM tasks;")
  end

  def your_custom_query_here(*args)
    # santitize/validate your arguments
    # prepare your statement
    # call `query!` to interact with the database
    # determine what should be returned
  end

  end #ends class
end # ends module



  # class Database



  #   def your_custom_query_here(*args)
  #     # sanitize/validate your arguments

  #     # prepare your statement

  #     # call `query!` to interact with the database

  #     # determine what should be returned
  #   end

  #   private

  #   def query!(statement, *params)
  #     db = SQLite3::Database.new(@database_path)
  #     db.execute statement, params
  #   rescue SQLite3::Exception => error
  #     # use this block to recover from an error
  #     # consider giving the user a special message back
  #     # inspect the `error` object for information about the error
  #   ensure
  #     db.close if db
  #   end
  # end
