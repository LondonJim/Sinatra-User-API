require 'json'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/signup'
require './models/login'
require './models/delete'

class UsersAPI < Sinatra::Base

  post '/users/signup' do
    body_data = JSON.parse(request.body.read)
    SignUp.create(body_data)
    content_type :json
    { message: "user created" }.to_json
  end

  post '/users/login' do
    body_data = JSON.parse(request.body.read)
    if LogIn.check?(body_data)
      content_type :json
      { message: "valid login" }.to_json
    else
      content_type :json
      { message: "not authorised" }.to_json
    end
  end

  delete '/users/delete/:id' do
    body_data = JSON.parse(request.body.read)
    params_data = params[:id]
    if Delete.check?(body_data, params_data)
      content_type :json
      { message: "user deleted" }.to_json
    else
      content_type :json
      { message: "not authorised" }.to_json
    end
  end

end
