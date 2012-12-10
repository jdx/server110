class Api::BaseController < ApplicationController
  skip_before_filter :authenticate_user!

  doorkeeper_for :all
  respond_to :json

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
