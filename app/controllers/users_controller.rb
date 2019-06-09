require './config/environment'

class UsersController < ApplicationController

get '/' do
    erb :'users/index'
end

get '/signup' do
    erb :'users/signup'
end

get '/login' do
    erb :'users/login'
end

end