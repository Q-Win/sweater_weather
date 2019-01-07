require 'rails_helper'

describe "user logins request" do
  it "user logs in with valid info" do
    VCR.use_cassette("successful_login_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/sessions?email=bob&password=cat'

      expect(response).to be_successful

      api_key = JSON.parse(response.body)
      
      expect(api_key).to be_a(Hash)
      expect(api_key['api_key']).to eq('testkey')
    end
  end

  it "user logs in with invalid info" do
    VCR.use_cassette("unsuccessful_login_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/sessions?email=bob&password=dog'

      error = JSON.parse(response.body)

      expect(error).to be_a(Hash)
      expect(error['error']).to eq('Incorrect user information.')
    end

  end

end
