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

  it "favorite request with invalid api key " do
    VCR.use_cassette("unsuccessful_favorite_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")

      post '/api/v1/favorites?location=denver&api_key=wrongkey'

      error = JSON.parse(response.body)

      expect(user.favorites.count).to eq(0)
      expect(error['error']).to eq("Incorrect API key")
    end
  end

  it "lists favorites request with invalid api key " do
    VCR.use_cassette("successful_favorite_get_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")
      favorite = user.favorites.create(location: "Chicago")
      favorite2 = user.favorites.create(location: "LA")
      binding.pry 
      get '/api/v1/favorites?api_key=testkey'

      favorites = JSON.parse(response.body)


    end
  end

end
