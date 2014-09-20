class InformationController < ApplicationController
  caches_action :cities, expires_in: 1.hour

  def cities
    @cities = Aqi.all
    render json: @cities.to_json
  end
end
