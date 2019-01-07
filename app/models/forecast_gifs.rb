class ForecastGifs

  attr_reader :time, :summary, :url

  def initialize(time, summary, url)
    @time = time
    @summary = summary
    @url = url
  end

  def set_id
    @time
  end

end
