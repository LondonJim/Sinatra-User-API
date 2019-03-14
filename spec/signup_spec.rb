require 'json'

describe "sign up" do

  def app
    UsersAPI.new
  end

  let(:body) { { name: "test_user",
                 email: "test_user@test_user.com",
                 password: "test_user_password"
               }.to_json }

  before(:each) do
    post '/users/signup', body, { 'CONTENT_TYPE' => 'application/json' }
  end

  it "returns sign up json response" do
    expect(last_response).to be_ok
  end





end
