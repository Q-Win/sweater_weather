require 'rails_helper'

describe "user request" do
  it "creates a new user" do
    VCR.use_cassette("successful_new_user_response_cassette") do

      post '/api/v1/users?email=bob&password=bob&password_confirmation=bob'

      expect(response).to be_successful

      api_key = JSON.parse(response.body)

      expect(api_key).to be_a(Hash)
      expect(User.first.email).to eq('bob')
    end
  end

  it "creates a new user" do
    VCR.use_cassette("unsuccessful_new_user_response_cassette") do

      post '/api/v1/users?email=bob&password=rob&password_confirmation=bob'

      expect(User.all.count).to eq(0)
    end
  end
end
