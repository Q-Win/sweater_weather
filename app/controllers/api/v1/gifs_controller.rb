class Api::V1::GifsController < ApplicationController

  def index
    # forecast = GifBuilder.new(params[:location]).forecast # => Array of DailyForecast objects
    # render json: DailyForecastSerializer.new(forecast)



    gifs = GifBuilder.new(params[:location])
    render json: GifBuilderSerializer.new(gifs)
  end
end
