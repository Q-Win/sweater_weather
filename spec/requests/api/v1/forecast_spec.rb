require 'rails_helper'

describe "forecast request" do
  it "sends weather data hash" do
    VCR.use_cassette("forecast_index_response_cassette") do

      get '/api/v1/forecast?location=Denver,CO'

      expect(response).to be_successful

      forecast = JSON.parse(response.body)

      expect(forecast).to be_a(Hash)
      expect(forecast["data"]["attributes"]).to have_key("currently")
      expect(forecast["data"]["attributes"]).to have_key("hourly")
      expect(forecast["data"]["attributes"]).to have_key("daily")
    end
  end
end
