class GoogleService

  def longitude(location)
    location_data(location)[:results][0][:geometry][:location][:lng]
  end

  def latitude(location)
    location_data(location)[:results][0][:geometry][:location][:lat]
  end

  def location_data(location)
    get_json("/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com")
  end

end
