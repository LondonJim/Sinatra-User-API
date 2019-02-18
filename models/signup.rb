require 'bcrypt'
require './models/user'

class SignUp

  include BCrypt

  def self.create(body_data)
    encrypted_pw = Password.create(body_data["password"])
    User.create(:name => body_data["name"], :email => body_data["email"], :password => encrypted_pw)
  end

end
