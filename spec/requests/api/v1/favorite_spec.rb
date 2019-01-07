require 'rails_helper'

describe "favorites request" do
  it "favorite request with valid api key " do
    VCR.use_cassette("successful_favorite_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/favorites?location=denver&api_key=testkey'

      expect(response).to be_successful

      expect(user.favorites[0].location).to eq("denver")
      expect(user.favorites.count).to eq(1)
    end
  end

  it "favorite request with valid api key " do
    VCR.use_cassette("unsuccessful_favorite_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/favorites?location=denver&api_key=wrongkey'

      error = JSON.parse(response.body)
      
      expect(user.favorites.count).to eq(0)
      expect(error['error']).to eq("Incorrect API key")
    end
  end

end
