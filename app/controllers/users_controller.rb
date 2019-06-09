require './config/environment'

class UsersController < ApplicationController

get '/' do
    erb :'users/index'
end

get '/signup' do
    erb :'users/signup'
end

post '/signup' do
    if !params[:username].empty? && !params[:password].empty?
        user = User.create(params)
        session[:user_id] = user.id
        redirect '/projects'
    else 
        redirect '/signup'
    end
end

get '/login' do
    erb :'users/login'
end

post '/login' do
    if !params[:username].empty? && !params[:password].empty?
        user = User.new(params)
        if user.authenticate(params[:password])
            user.save
            session[:user_id] = user.id
            redirect '/projects'
        else 
            "Please input your name"
            redirect '/login'
        end
    else
        redirect '/login'
    end
end

end