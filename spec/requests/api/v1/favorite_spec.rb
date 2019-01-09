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

  it "lists favorites request with valid api key " do
    VCR.use_cassette("successful_favorite_get_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")
      favorite = user.favorites.create(location: "Chicago")
      favorite2 = user.favorites.create(location: "LA")

      get '/api/v1/favorites?api_key=testkey'

      favorites = JSON.parse(response.body)
      expect(favorites["body"].count).to eq(2)
      expect(favorites["body"][0]["location"]).to eq("Chicago")
      expect(favorites["body"][1]["location"]).to eq("LA")
    end
  end

  it " wont list favorites request with invalid api key " do
    VCR.use_cassette("unsuccessful_favorite_get_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")
      favorite = user.favorites.create(location: "Chicago")
      favorite2 = user.favorites.create(location: "LA")

      get '/api/v1/favorites?api_key=wrongkey'

      error = JSON.parse(response.body)

      expect(error['error']).to eq("Incorrect API key")
    end
  end

  it " will delete a favorite with valid api key " do
    VCR.use_cassette("successful_favorite_delete_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")
      favorite = user.favorites.create(location: "Chicago")
      favorite2 = user.favorites.create(location: "LA")
      favorite3 = user.favorites.create(location: "FoCo")

      delete '/api/v1/favorites?api_key=testkey&location=LA'

      message = JSON.parse(response.body)

      expect(user.favorites.count).to eq(2)
      expect(message["body"][1]["location"]). to eq("FoCo")
    end
  end

  it " will not delete a favorite with invalid api key " do
    VCR.use_cassette("unsuccessful_favorite_delete_cassette") do
      user = User.create(email: 'bob', password: 'cat', api_key: "testkey")
      favorite = user.favorites.create(location: "Chicago")
      favorite2 = user.favorites.create(location: "LA")
      favorite3 = user.favorites.create(location: "FoCo")

      delete '/api/v1/favorites?api_key=wrongkey&location=LA'

      error = JSON.parse(response.body)

      expect(error['error']).to eq("Incorrect API key")
      expect(user.favorites.count).to eq(3)
    end
  end
end
