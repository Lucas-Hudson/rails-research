class SearchableAttribute < ApplicationRecord
  belongs_to :searchable_attribute_category
  has_many :org_searchable_attributes, dependent: :destroy
  has_many :orgs, through: :org_searchable_attributes
end
