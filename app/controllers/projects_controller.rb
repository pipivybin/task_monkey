require './config/environment'

class ProjectsController < ApplicationController

get '/projects' do
    @user = User.find(session[:user_id])
    @projects = @user.projects
    erb :'/projects/projects'
end

get '/projects/new' do
    @users = User.all
    erb :'projects/new'
end

end
