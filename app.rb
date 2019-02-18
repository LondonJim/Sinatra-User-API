require 'json'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/user'

class UsersAPI < Sinatra::Base

  post '/users/signup' do
    data = JSON.parse(request.body.read)
    User.create(:name => data["name"], :email => data["email"], :password => data["password"])
  end

  post '/users/login' do
    data = JSON.parse(request.body.read)
    User.exists?(:name => data["name"], :password => data["password"])
  end

  delete '/users/delete/:id' do
    User.destroy(params[:id])
  end

end
