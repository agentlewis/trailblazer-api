require 'contexts/get_oauth_user'
require 'contexts/get_google_apps_domain'

class DomainsController < ApplicationController

  # Endpoint for configuring a domain.
  #
  # GET /domains/example.com/configure
  def configure
    if user_signed_in?
      @domain = GetGoogleAppsDomain.new(:user => current_user, :domain_name => params[:domain_name]).call
    else
      store_location(request.url)
      redirect_to '/auth/google_apps'
    end
  end
end
