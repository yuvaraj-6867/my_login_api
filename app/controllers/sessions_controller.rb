class SessionsController < ApplicationController
  def create
    email = params[:session] ? params[:session][:email] : params[:email]
    password = params[:session] ? params[:session][:password] : params[:password]
    
    user = User.find_by(email: email)
    
    if user.nil?
      render json: { error: "User not found. Please sign up first." }, status: :unauthorized
    elsif user.authenticate(password)
      session[:user_id] = user.id
      render json: { 
        message: "Signed in successfully", 
        user: { id: user.id, email: user.email, full_name: user.full_name },
        user_exists_in_db: true
      }
    else
      render json: { error: "Wrong password" }, status: :unauthorized
    end
  end
end
