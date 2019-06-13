require './config/environment'

class TasksController < ApplicationController

get '/projects/:id/edit' do
    if logged_in? 
        @user = current_user
        @project = Project.find(params[:id])
        if @project.users.include?(@user)
            erb :'/tasks/edit'
        else 
            redirect '/login'
        end
    else
        redirect '/login'
    end
end

patch '/projects/:id/edit' do
    project = Project.find(params[:id])
    if project.users.include?(current_user)
        if !params[:project][:name].empty?
            project.update(params[:project])
        else
            redirect "/projects/#{project.id}/edit"
        end
        if params[:tasks].values.any?{|h| h.values.join.empty?}
            redirect "/projects/#{project.id}/edit"
        else
            Task.update(params[:tasks].keys, params[:tasks].values) 
        end
        if !params[:new][:name].empty?
            project.tasks.create(params[:new])
        end
    else
        redirect '/login'
    end
    redirect "/projects/#{params[:id]}"   
end

end
