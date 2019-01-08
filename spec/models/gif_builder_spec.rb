require 'rails_helper'

describe GifBuilder do
  subject { GifBuilder.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(GifBuilder)
  end

  it 'can get summaries of the daily forecast' do
    VCR.use_cassette("daily_forecast_cassette") do
      forecast = GifBuilder.new("Denver")
      expect(forecast.get_summaries_of_forcast).to be_a(Array)
      expect(forecast.get_summaries_of_forcast[0]).to eq("Breezy in the afternoon and partly cloudy starting in the evening.")
      expect(forecast.get_summaries_of_forcast.count).to eq(8)
    end
  end

  it 'can get summaries of the daily forecast' do
    VCR.use_cassette("forecast_gif_json_cassette") do
      forecast = GifBuilder.new("Denver")
      result = forecast.forecast

      expect(result).to be_a(Array)
      expect(result.count).to eq(8)
    end
  end

  it 'can get summaries of the daily forecast' do
    VCR.use_cassette("json_id_cassette") do
      result = GifBuilder.new("Denver").json_id

      expect(result).to be_a(String)
    end
  end

end
