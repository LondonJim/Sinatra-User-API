require 'bcrypt'
require 'json'
require './models/user'

class Delete

  include BCrypt

  def self.check?(body_data, params_data)
    user = User.find_by(:name => body_data["name"], :email => body_data["email"])
    if Password.new(user[:password]) == body_data["password"] && user.id = params_data
      User.destroy(params_data)
      true
    else
      false
    end
  end

end
