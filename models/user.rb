class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }, presence: true
  validates :password, presence: true
end
