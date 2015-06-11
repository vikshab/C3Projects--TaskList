require "sinatra"
require "sinatra/reloader"
require "./lib/task_data"

class MySite < Sinatra::Base
  register Sinatra::Reloader
  also_reload './lib/task_data'

  get '/' do
    my_task_data = TaskList::TaskData.new("task_data")
    @all_tasks = my_task_data.display_list

    erb :index
  end

  get '/add_task' do
    erb :add_task
  end

  post '/' do
    # TODO: COME BACK TO THIS!!!!
    params[:task] == "walk the dog"
    params[:description] == "he needs exercise"

    my_task_data = TaskList::TaskData.new("task_data")
    my_task_data.add_task(params[:task], params[:description])
    @all_tasks = my_task_data.display_list

    # needs to add the user's new task to the database
    # then display the full list of tasks from the db
    erb :index
  end

end
