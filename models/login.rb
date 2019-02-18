require 'bcrypt'
require 'json'
require './models/user'

class LogIn

  include BCrypt

  def self.check?(body_data)
    user = User.find_by(:name => body_data["name"], :email => body_data["email"])
    if Password.new(user[:password]) == body_data["password"]
      true
    else
      false
    end
  end

end
