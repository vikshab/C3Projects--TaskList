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

  get '/delete_task' do
    my_task_data = TaskList::TaskData.new("task_data")
    @all_tasks = my_task_data.display_list
    @title = "Delete Task"
    erb :delete_task
  end

  post '/add_task' do
    my_task_data = TaskList::TaskData.new("task_data")
    my_task_data.add_task(params[:task], params[:description])
    redirect to '/'
  end

  post '/' do
    my_task_data = TaskList::TaskData.new("task_data")
    my_task_data.complete_tasks(params[:complete])

    @all_tasks = my_task_data.display_list
    @title = "Todo List"

    erb :index
  end

  post '/delete_task' do
    @tasks_to_delete = params[:delete].join(",")
    erb :delete_confirmation
  end

  post '/delete_confirmation' do
    @tasks_to_delete = params[:tasks_to_delete]

    if params[:confirm] == "Yes"
      my_task_data = TaskList::TaskData.new("task_data")
      my_task_data.delete_tasks(@tasks_to_delete.split(","))
    end

    redirect to '/'
  end
end
