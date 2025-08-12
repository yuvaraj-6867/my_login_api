class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      # Handle successful login (e.g., create session or return token)
      render json: { message: "Signed in successfully" }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
