require "sinatra"
require "sinatra/reloader"
require "./lib/task_data"

class MySite < Sinatra::Base
  register Sinatra::Reloader
  also_reload './lib/task_data'

  get '/' do
    my_task_data = TaskList::TaskData.new("task_data")
    @all_tasks = my_task_data.display_list
    @title = "Todo List"
    erb :index
  end

  get '/add_task' do
    @title = "Add Task"
    erb :add_task
  end

  post '/' do
    my_task_data = TaskList::TaskData.new("task_data")
    my_task_data.add_task(params[:task], params[:description])
    @all_tasks = my_task_data.display_list

    erb :index
  end
end
