class Org < ApplicationRecord
  paginates_per 10

  has_one :org_place
  has_one :place, through: :org_place
  accepts_nested_attributes_for :place
  has_many :org_searchable_attributes, dependent: :destroy
  has_many :searchable_attributes, through: :org_searchable_attributes

  include SlugConcern
  extend Geocoder::Model::ActiveRecord
  geocoded_by"places.address"
  reverse_geocoded_by "places.latitude", "places.longitude"
end
