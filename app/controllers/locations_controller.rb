class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def new
    @location = Location.new
  end

  def create
    start_point = params['location']['address']['1']
    end_point = params['location']['address']['2']

    if !start_point.empty? && !end_point.empty?

      distance = Distance.create
      start_location = Location.create(address: start_point, is_starting_point: true, distance_id: distance.id)
      end_location = Location.create(address: end_point, is_starting_point: false, distance_id: distance.id)
      distance.update_column(:distance_in_km, start_location.distance_to(end_location).round(2))

      redirect_to distance_path(distance)
    else
      render :new
    end
  end
end
