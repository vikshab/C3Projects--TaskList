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

    def complete_tasks(tasks_to_complete)
      tasks_to_complete.each do |task_id|
        query!("UPDATE tasks SET completed_on='#{Time.now}' WHERE id=#{task_id};")
      end
    end
  end
end
