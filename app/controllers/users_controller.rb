class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.map { |u| { id: u.id, email: u.email, full_name: u.full_name, created_at: u.created_at } }
  end

  def new
    @user = User.new
  end

  def create
    unless params[:terms_accepted]
      return render json: { error: "You must accept terms and conditions" }, status: :unprocessable_entity
    end
    
    user = User.new(user_params)
    if user.save
      render json: { 
        message: "User created successfully", 
        user: { id: user.id, email: user.email, full_name: user.full_name } 
      }, status: :created
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
