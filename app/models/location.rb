class Location < ActiveRecord::Base
  belongs_to :distance

  geocoded_by :address
  after_validation :geocode
end
