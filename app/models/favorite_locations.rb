class FavoriteLocations

  def initialize(user)
    @user = user
  end

  def json_id
    "#{Time.now}"
  end

  def favorites_forecats
    @user.favorites.map do |favorite|
      hash = {}
      hash[:location] = favorite.location
      hash[:current_weather] = currently(favorite.location)[:summary]
      hash
    end
  end

  def currently(location)
    get_forecast(location)[:currently]
  end

  def get_forecast(location)
    @forecast ||= dark_sky_service.get_forecast_data(lat(location),lng(location))
  end
  private

  def google_service
    GoogleService.new
  end

  def lat(location)
    google_service.latitude(location)
  end

  def lng(location)
    google_service.longitude(location)
  end

  def dark_sky_service
    DarkSkyService.new
  end

end
