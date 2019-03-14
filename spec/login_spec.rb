require 'json'

describe "sign up" do

  def app
    @app = UsersAPI.new
  end

  let(:body) { { name: "test_user",
                 email: "testuser@testuser.com",
                 password: "test_user_password"
               }.to_json }

  it "returns sign up log in json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/login', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to include("valid login")
  end

end
