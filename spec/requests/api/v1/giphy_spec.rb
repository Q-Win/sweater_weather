require 'rails_helper'

describe "gif request" do
  it "sends gif data" do
    VCR.use_cassette("gif_response_cassette") do

      get '/api/v1/gifs?location=denver,co'

      expect(response).to be_successful
      binding.pry 
      gif = JSON.parse(response.body)

      expect(gif).to be_a(Hash)
      expect(gif["data"]["daily_forecasts"]).to be_a(Array)
      expect(gif["data"]["daily_forecasts"][0]).to have_key("time")
      expect(gif["data"]["daily_forecasts"][0]).to have_key("url")
      expect(gif["data"]["daily_forecasts"][0]).to have_key("summary")

    end
  end
end
