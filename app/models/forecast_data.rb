class ForecastData

  def initialize(location)
    @location = location
  end

  def json_id
    "#{@location} weather at #{Time.now}"
  end

  def currently
    get_forecast[:currently]
  end

  def hourly
    get_forecast[:hourly]
  end

  def daily
    get_forecast[:daily]
  end

  def get_forecast
    @forecast ||= dark_sky_service.get_forecast_data(lat,lng)
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

end
