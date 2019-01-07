require 'rails_helper'

describe GiphyService do
  subject {GiphyService.new}

  it 'exists' do
    expect(subject).to be_a(GiphyService)
  end

  it 'instance methods' do
    VCR.use_cassette("giphy_cassette") do
      service = GiphyService.new
      response = service.find_gif("cat")

      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data][0][:type]).to eq("gif")
      expect(response[:data][0][:url]).to eq("https://giphy.com/gifs/JIX9t2j0ZTN9S")

    end
  end
end
