class User < ActiveRecord::Base
    has_many :tasks
    has_many :projects, through: :tasks 
    has_secure_password
end