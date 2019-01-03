require 'rails_helper'

describe DarkSkyService do
  subject {DarkSkyService.new}

  it 'exists' do
    expect(subject).to be_a(DarkSkyService)
  end

  it 'instance methods' do
    VCR.use_cassette("dark_sky_service_forecast_cassette") do
      lat = 39.7392358
      lng = -104.990251
      service = DarkSkyService.new
      response = service.get_forecast_data(lat,lng)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:currently)
      expect(response).to have_key(:hourly)
      expect(response).to have_key(:daily)
      expect(response[:timezone]).to eq("America/Denver")
    end
  end
end
