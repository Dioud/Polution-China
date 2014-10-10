class InformationController < ApplicationController
  # caches_action :cities, expires_in: 45.minutes

  def cities
    @cities = Aqi.all
    render json: @cities.to_json
  end
end
