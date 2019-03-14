require 'json'

describe "log in" do

  def app
    @app = UsersAPI.new
  end

  let(:body) { { name: "test_user",
                 email: "testuser@testuser.com",
                 password: "test_user_password"
               }.to_json }

  let(:wrong_pw_body) { { name: "test_user",
                          email: "testuser@testuser.com",
                          password: "wrong_password"
                        }.to_json }

  it "returns log in json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/login', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to include("valid login")
  end

  it "returns not authorised log in json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/login', wrong_pw_body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": "not authorised" }.to_json)
  end

end
