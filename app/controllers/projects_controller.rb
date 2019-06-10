require './config/environment'

class ProjectsController < ApplicationController

get '/projects' do
    if logged_in?
    @user = current_user
    #binding.pry
    @projects = @user.projects
    
    erb :'/projects/projects'
    else
        redirect '/login'
    end
end

get '/projects/new' do
    if logged_in? #verify if user is on the project
    @users = User.all
    erb :'projects/new'
    else
        redirect '/login'
    end
end

post '/projects/new' do
    if !params[:name].empty?
        @project = Project.create(name: params[:name])
        task = @project.tasks.create(params[:task])
        user = User.find(current_user) #if logged_in?
        user.tasks << task
        redirect '/projects'
    else 
        redirect '/projects/new'
    end
end

end
