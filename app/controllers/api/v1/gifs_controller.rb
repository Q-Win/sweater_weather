class Api::V1::GifsController < ApplicationController

  def index
    forecast = GifBuilder.new(params[:location]).forecast  
    render json: DailyForecastSerializer.new(forecast)
  end
end
