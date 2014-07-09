module Api::V1
  class ApiController < ActionController::Base

    private

    def current_resource_owner
      @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end

