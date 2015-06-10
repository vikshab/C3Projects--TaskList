require "sinatra"
require "sinatra/reloader"
require "./lib/task_data"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :index
  end

  get '/add_task' do
    erb :add_task
  end

end
