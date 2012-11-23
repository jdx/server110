class Api::BaseController < ActionController::Metal
  include AbstractController::Callbacks
  include ActionController::Head
  include Doorkeeper::Helpers::Filter
  doorkeeper_for :all

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
