class MessagesController < ApplicationController

  before_action :authenticate_user

  def index
    @user_name = $redis.get(session[:session_id])
    @messages = $redis.lrange('messages', -10, -1)

    respond_to do |format|
      format.html
      format.json {render json: @messages}
    end
  end

  def create
    permit_params = params.require(:message).permit(:text)
    message_data = {user: $redis.get(session[:session_id]), text: permit_params[:text]}

    $redis.rpush('messages', message_data.to_json)
    redirect_to messages_path
  end
end
