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

post '/projects/new' do
    if !params[:project][:name].empty?
        @project = Project.create(params[:project])
        params[:project][:user_ids].each do |i|
            user = User.find(i)
            user.projects << @project
            user.save
            project.users << user
            project.save
            user.tasks.create(params[:task])
        end

    else 
    end
end

end
