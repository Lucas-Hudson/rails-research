class Place < ApplicationRecord
  has_one :org_place
  has_one :org, through: :org_place

  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  # after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }
end
