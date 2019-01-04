class Api::V1::UsersController < ApplicationController

  def create

    user = User.new(email: user_params[:email], password: user_params[:password])
    if (user_params[:password] == user_params[:password_confirmation]) && user.save
      user.generate_api_key
      render json: {API_key: "#{user.api_key}"}
    else
      render json: {ERROR: "Invalid information. Please Try again"}
    end

  end

  private

  def user_params
    params.permit(:email, :password,:password_confirmation)
  end
end
