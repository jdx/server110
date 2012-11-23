class OmniauthController < ApplicationController
  skip_before_filter :authorize

  def twitter
    session[:user_id] = User.from_omniauth(request.env['omniauth.auth'])
    redirect_to root_path
  end
end
