require 'rails_helper'

describe GifBuilder do
  subject { GifBuilder.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(GifBuilder)
  end

  it 'can get gifs for the forecast' do
    VCR.use_cassette("gif_builder_cassette") do
      forecast = GifBuilder.new("Denver")
      expect(forecast.get_summaries_of_forcast).to be_a(Array)
      expect(forecast.get_summaries_of_forcast[0]).to eq("Partly cloudy until afternoon.")
    end
  end

end
