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
        if !params[:name].empty?
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
        Project.delete(params[:id])
        redirect '/projects'
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

get '/projects/:id/edit' do
    if logged_in?
        @user = current_user
        @project = Project.find(params[:id])
        erb :'/projects/edit'
    else
        redirect '/login'
    end
end

patch '/projects/:id/edit' do
    project = Project.find(params[:id])
    project.update(params[:project])
    Task.update(params[:tasks].keys, params[:tasks].values)    
    redirect "/projects/#{params[:id]}"   
end

end
