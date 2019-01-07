require 'rails_helper'

describe "gif request" do
  it "sends gif data" do
    VCR.use_cassette("gif_response_cassette") do

      get '/api/v1/gifs?location=denver,co'

      expect(response).to be_successful

      gif = JSON.parse(response.body)

      expect(gif).to be_a(Hash)
      expect(gif["data"]).to be_a(Array)
      expect(gif["data"][0]["attributes"]["summary"]).to eq("Breezy in the afternoon and partly cloudy starting in the evening.")
      expect(gif["data"][1]["attributes"]["url"]).to eq("https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE")
    end
  end
end
