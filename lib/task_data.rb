require 'sqlite3'
require_relative './database'

module TaskList
  class TaskData < Database

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
