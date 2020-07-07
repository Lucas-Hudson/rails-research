class Place < ApplicationRecord
  belongs_to :org

  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
