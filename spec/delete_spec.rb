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

  it "returns delete user json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/login', body, { 'CONTENT_TYPE' => 'application/json' }
    delete '/users/delete/1', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": "user deleted" }.to_json )
  end

  it "returns not authorised delete user json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/login', body, { 'CONTENT_TYPE' => 'application/json' }
    delete '/users/delete/1', wrong_pw_body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": "not authorised" }.to_json )
  end

end
