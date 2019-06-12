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
        project.update(params[:project])
        if params[:tasks].values.any?{|h| h.values.join.empty?}
            redirect "/projects/#{project.id}/edit"
        else
            Task.update(params[:tasks].keys, params[:tasks].values) 
        end
        if !params[:new][:name].empty?
            #binding.pry
            task = Task.new(params[:new])
            task.user = current_user
            task.project = project
            task.save

            #task = project.tasks.create(params[:new])
            #current_user.tasks << task
            #binding.pry
        end
        redirect "/projects/#{project.id}"
        
    else
        redirect '/login'
    end
    redirect "/projects/#{params[:id]}"   
end

delete '/projects/tasks/:id/delete' do
    if logged_in? 
        task = Task.find(params[:id]) 
        #binding.pry
        if current_user.tasks.include?(task)
            Task.delete(params[:id])
            redirect "/projects/#{task.project_id}"
        else
            redirect '/login'
        end
    else
        redirect '/login'
    end
end

end
