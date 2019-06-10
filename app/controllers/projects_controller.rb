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

end
