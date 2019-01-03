require 'rails_helper'

describe GoogleService do
  subject {GoogleService.new}

  it 'exists' do
    expect(subject).to be_a(GoogleService)
  end

  it 'can get_coordinates' do
    VCR.use_cassette("google_service_coordinates_cassette") do
      location = "Denver, CO"
      service = GoogleService.new
      response = service.location_data(location)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(service.longitude(location)).to eq(-104.990251)
      expect(service.latitude(location)).to eq(39.7392358)
    end
  end
end
