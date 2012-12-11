class Api::BaseController < ApplicationController
  skip_before_filter :authenticate_user!

  doorkeeper_for :all, unless: -> { Rails.env.development? }
  respond_to :json

  private

  def current_user
    @user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    @user ||= authenticate_user!
  end
end
