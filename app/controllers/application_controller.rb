class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  before_action :set_cors_headers
  
  private
  
  def set_cors_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
    
    if request.method == 'OPTIONS'
      head :ok
    end
  end
  
  def handle_options_request
    head :ok
  end
end
