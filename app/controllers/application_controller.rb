class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :auth_filter

  helper_method :current_user

  protected

  def auth_filter
    redirect_to welcome_url unless authenticated?
  end

  def authenticated?
    !session[:user_id].nil?
  end

  def current_user
    @user = User.find(session[:user_id]) if authenticated?
  end

end
