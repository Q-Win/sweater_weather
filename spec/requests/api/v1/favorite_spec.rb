require 'rails_helper'

describe "favorites request" do
  it "favorite request with valid api key " do
    VCR.use_cassette("successful_favorite_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/favorites?location=denver&api_key=testkey'

      expect(response).to be_successful

      expect(user.favorites[0].location).to eq("denver")
    end
  end

end
