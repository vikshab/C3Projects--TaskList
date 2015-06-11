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
  end
end
