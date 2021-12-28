class UsersController < ApplicationController
  def show
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      render json: user
    else
      render json: {error: "Error"}, status: :unauthorized
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user
    else
      render json: {error: "Error"}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
