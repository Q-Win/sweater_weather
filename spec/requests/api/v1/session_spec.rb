require 'rails_helper'

describe "user logins request" do
  it "user logs in with valid info" do
    VCR.use_cassette("successful_login_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/sessions'

      expect(response).to be_successful

      api_key = JSON.parse(response.body)

      expect(api_key).to be_a(Hash)
      expect(api_key[:api_key]).to eq('testkey')
    end
  end


end
