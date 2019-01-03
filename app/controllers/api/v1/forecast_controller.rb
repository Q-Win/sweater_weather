class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastData.new(params[:location])
    # render json: forecast.get_forecast
    render json: ForecastDataSerializer.new(forecast)

  end
end
