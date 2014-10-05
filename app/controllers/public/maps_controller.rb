class Public::MapsController < ApplicationController
  before_action :set_map

  def show
  end

private

  def set_map
    @map = Assignment.where(:visible => true)
                     .find_by(:public_url_token => map_params[:token])

    raise ActiveRecord::RecordNotFound unless @map
  end

  def map_params
    params.permit(:token)
  end
end
