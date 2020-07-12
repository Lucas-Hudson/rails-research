class Org < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  paginates_per 20

  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :place

  has_many :org_searchable_attributes, dependent: :destroy
  has_many :searchable_attributes, through: :org_searchable_attributes

  extend Geocoder::Model::ActiveRecord
  geocoded_by"places.address"
  reverse_geocoded_by "places.latitude", "places.longitude"
end
