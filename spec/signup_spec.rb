require 'json'

describe "sign up" do

  def app
    @app = UsersAPI.new
  end

  let(:body) { { name: "test_user",
                 email: "testuser@testuser.com",
                 password: "test_user_password"
               }.to_json }

  it "returns valid sign up json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": "user created" }.to_json)
  end

  it "returns errors sign up json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": ["Name has already been taken",
                                                   "Email has already been taken"]
                                      }.to_json)
  end

end
