class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    messages = Message.all
    render json: messages.map { |msg|
      {
        id: msg.id,
        text: msg.content,
        from: msg.sender_id == 1 ? 'me' : 'them',
        created_at: msg.created_at
      }
    }
  end

  def create
    message = Message.new(
      sender_id: params[:sender_id] || 1,
      receiver_id: params[:receiver_id] || 2,
      content: params[:content]
    )
    
    if message.save
      render json: {
        id: message.id,
        text: message.content,
        from: 'me',
        created_at: message.created_at
      }, status: :created
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    render json: { message: 'Message deleted' }
  end
end