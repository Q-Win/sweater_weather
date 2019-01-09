class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user == nil
      render json: { :error => "Incorrect API key" }, status: 401
    else
      favorites = FavoriteLocations.new(user)
      render json: {:body => favorites.favorites_forecasts}, status: 200
    end


  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user == nil
      render json: { :error => "Incorrect API key" }, status: 401
    else
      favorite = user.favorites.create(location: params[:location])
      render json: { :message => "#{params[:location]} added to favorites" }, status: 200
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user == nil
      render json: { :error => "Incorrect API key" }, status: 401
    else
      location = user.favorites.find_by(location: params[:location])
      location.destroy
      favorites = FavoriteLocations.new(user)
      render json: {:body => favorites.favorites_forecasts}, status: 200
    end
  end


end
