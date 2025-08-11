class SessionsController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)
    if user&.authenticate(password)
      render json: { message: "Signed in successfully" }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
