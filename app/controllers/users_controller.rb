class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
    rescue => e
      Rails.logger.error("Signup Error: #{e.message}")
      render json: { error: "Internal server error" }, status: :internal_server_error
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
