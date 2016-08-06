class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    user_name = $redis.get(session[:session_id])
    redirect_to new_user_path if user_name.blank?
  end
end
