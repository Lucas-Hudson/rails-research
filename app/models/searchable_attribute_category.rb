class SearchableAttributeCategory < ApplicationRecord
  has_many :searchable_attributes, dependent: :destroy
end
