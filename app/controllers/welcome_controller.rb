class WelcomeController < ApplicationController
  def index
    render plain: "Welcome to My App!"
  end
end
