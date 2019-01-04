class GifBuilder

  def initialize(location)
    @location = location
  end

  def json_id
    "#{@location} weather at #{Time.now}"
  end

  def get_forecast
    @forecast ||= dark_sky_service.get_forecast_data(lat,lng)
  end

  def get_summaries_of_forcast
    daily[:data].map do |day|
      day[:summary]
    end
  end

  private

  def google_service
    GoogleService.new
  end

  def lat
    google_service.latitude(@location)
  end

  def lng
    google_service.longitude(@location)
  end

  def dark_sky_service
    DarkSkyService.new
  end

  def giphy_service
    GiphyService.new
  end

  def daily
    get_forecast[:daily]
  end

end
