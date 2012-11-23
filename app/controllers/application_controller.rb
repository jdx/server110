class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  private

  def authorize
    redirect_to '/auth/twitter' unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  helper_method :current_user
end
