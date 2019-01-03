require 'rails_helper'

describe ForecastData do
  subject { ForecastData.new('denver,co') }

  it 'exists' do
    expect(subject).to be_a(ForecastData)
  end

end
