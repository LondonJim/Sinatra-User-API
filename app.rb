require 'dotenv'
require 'bcrypt'
require 'json'
require 'jwt'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/user'

class UsersAPI < Sinatra::Base

  include BCrypt

  post '/users/signup' do
    body_data = JSON.parse(request.body.read)
    encrypted_pw = Password.create(body_data["password"])
    user = User.create(:name => body_data["name"], :email => body_data["email"], :password => encrypted_pw)
    if user.valid?
      { message: "user created" }.to_json
    else
      { message: user.errors.full_messages }.to_json
    end
  end

  post '/users/login' do
    body_data = JSON.parse(request.body.read)
    user = User.find_by(:name => body_data["name"], :email => body_data["email"])
    if Password.new(user[:password]) == body_data["password"]
      { message: "valid login", token: token(user[:name]) }.to_json
    else
      { message: "not authorised" }.to_json
    end
  end

  delete '/users/delete/:id' do
    body_data = JSON.parse(request.body.read)
    params_data = params[:id]
    user = User.find_by(:name => body_data["name"], :email => body_data["email"])
    if Password.new(user[:password]) == body_data["password"] && user.id = params_data
      User.destroy(params_data)
      { message: "user deleted" }.to_json
    else
      { message: "not authorised" }.to_json
    end
  end

  def token(user_name)
    JWT.encode payload(user_name), ENV['JWT_SECRET'], 'HS256'
  end

  def payload(user_name)
    {
      exp: Time.now.to_i + 60 * 60,
      user: {
        user: user_name
      }
    }
  end

end
