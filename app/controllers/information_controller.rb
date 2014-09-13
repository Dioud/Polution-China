class InformationController < ApplicationController
  def cities
    @cities = Aqi.all
    render json: @cities.to_json
  end
end
