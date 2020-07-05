class Org < ApplicationRecord
  has_one :place
  accepts_nested_attributes_for :place

  extend Geocoder::Model::ActiveRecord
  geocoded_by"places.address"
  reverse_geocoded_by "places.latitude", "places.longitude"
end
