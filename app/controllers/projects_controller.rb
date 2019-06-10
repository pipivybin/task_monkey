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
    if logged_in? 
        @user = current_user
        erb :'projects/new'
    else
        redirect '/login'
    end
end

post '/projects/new' do
    if logged_in?
        if !params[:name].empty? && !params[:task][:name].empty?
            @project = Project.create(name: params[:name])
            task = @project.tasks.create(params[:task])
            current_user.tasks << task
            redirect '/projects'
        else 
            redirect '/projects/new'
        end
    else
        redirect '/login'
    end
end

delete '/projects/:id/delete' do
    if logged_in?
        project = Project.find(params[:id])
        if project.users.include?(current_user)
            Project.delete(params[:id])
            redirect '/projects'
        else 
            redirect '/login'
        end
    else
        redirect '/login'
    end
end

get '/projects/:id' do
    if logged_in?
        @user = current_user
        @project = Project.find(params[:id])
        erb :'/projects/show'
    else
        redirect '/login'
    end
end



end
