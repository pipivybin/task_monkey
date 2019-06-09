require './config/environment'

class ProjectsController < ApplicationController

get '/projects' do
    @user = User.find(session[:user_id])
    @projects = @user.projects
    erb :'/projects/projects'
end

end
