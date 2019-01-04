class Api::V1::GifsController < ApplicationController

  def index
    gifs = GifBuilder.new(params[:location])
    render json: GifBuilderSerializer.new(gifs)
  end
end
