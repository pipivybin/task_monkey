require './config/environment'

class ProjectsController < ApplicationController

get '/projects' do
    @user = User.find(session[:user_id])
    erb :'/projects/projects'
end

end
