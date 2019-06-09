require './config/environment'

class UsersController < ApplicationController

get '/' do
 erb :'users/index'
end

get '/signup' do
    
end

get '/login' do

end

end