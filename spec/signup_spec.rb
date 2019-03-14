require 'json'

describe "sign up" do

  def app
    @app = UsersAPI.new
  end

  let(:body) { { name: "test_useruser",
                 email: "testuser@testuseruser.com",
                 password: "test_user_password"
               }.to_json }

  it "returns sign up json response" do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
    expect(last_response.body).to eq({ "message": "user created" }.to_json)
  end

  # it "returns sign up log in json response" do
  #   post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
  #   post '/users/login', body, { 'CONTENT_TYPE' => 'application/json' }
  #   expect(last_response).to eq('sausage')
  # end

end
