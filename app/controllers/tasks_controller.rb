require './config/environment'

class TasksController < ApplicationController

get '/projects/:id/edit' do
    if logged_in?
        @user = current_user
        @project = Project.find(params[:id])
        erb :'/tasks/edit'
    else
        redirect '/login'
    end
end

patch '/projects/:id/edit' do
    project = Project.find(params[:id])
    project.update(params[:project])
    Task.update(params[:tasks].keys, params[:tasks].values) 
    if !params[:new][:name].empty?
        project.tasks.create(params[:new])
    end
    redirect "/projects/#{params[:id]}"   
end

end
