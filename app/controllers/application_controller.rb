require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "monkeyking"

  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      "hello world"
    end

  end

end


##how to clear database???