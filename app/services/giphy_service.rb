class GiphyService


  def find_gif(theme)
    get_json("/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{theme}&limit=1")
  end

  def return_gif_url(theme)
    find_gif(theme)[:data][0][:url]
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.giphy.com")
  end

end
