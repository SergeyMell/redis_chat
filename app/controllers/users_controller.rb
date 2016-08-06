class UsersController < ApplicationController

  def new

  end

  def create
    user_data = params.require(:user).permit(:name)
    $redis.set(session[:session_id], user_data[:name], ex: 1.hour)
    redirect_to root_path
  end

end
