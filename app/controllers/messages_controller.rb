class MessagesController < ApplicationController

  before_action :authenticate_user

  def index
    @user_name = $redis.get(session[:session_id])
  end

  def create

  end
end
