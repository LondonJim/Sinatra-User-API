require 'bcrypt'
require 'json'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/user'

class UsersAPI < Sinatra::Base

  include BCrypt

  post '/users/signup' do
    data = JSON.parse(request.body.read)
    encrypted_pw = Password.create(data["password"])
    User.create(:name => data["name"], :email => data["email"], :password => encrypted_pw)
  end

  post '/users/login' do
    data = JSON.parse(request.body.read)
    user = User.find_by(:name => data["name"], :email => data["email"])
    if Password.new(user[:password]) == data["password"]
      puts "VALID"
    else
      puts "NOT VALID"
    end
  end

  delete '/users/delete/:id' do
    data = JSON.parse(request.body.read)
    user = User.find_by(:name => data["name"], :email => data["email"])
    if Password.new(user[:password]) == data["password"] && user.id = params[:id]
      puts "DELETED"
      User.destroy(params[:id])
    else
      puts "USER DETAILS NOT CORRECT"
    end
  end

end
