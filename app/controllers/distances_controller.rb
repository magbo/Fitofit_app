class DistancesController < ApplicationController
  def index
    @distances = Distance.all.where('created_at > ?', Date.today - 7)

  end
  def show
  	@distance = Distance.find(params[:id])
  	last_7_days = Distance.all.where('created_at > ?', Date.today - 7)
    distances_from_last_7_days = last_7_days.map(&:distance_in_km).compact
  	@stats_7_days = distances_from_last_7_days.inject{|sum, x| sum + x}
  end
end
