require 'rails_helper'

describe ForecastData do
  subject { ForecastData.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(ForecastData)
  end

  it 'can get a forecast' do
    VCR.use_cassette("forecast_data_cassette") do
      forecast = ForecastData.new("Denver")
      expect(forecast.currently).to be_a(Hash)
      expect(forecast.hourly).to be_a(Hash)
      expect(forecast.daily).to be_a(Hash)
      expect(forecast.json_id).to be_a(String)
    end
  end

end
