class SearchableAttribute < ApplicationRecord
  belongs_to :searchable_attribute_category
  has_many :org_searchable_attributes, dependent: :destroy
  has_many :orgs, through: :org_searchable_attributes

  scope :mandatories, -> { joins(:searchable_attribute_category).where(searchable_attribute_categories: {mandatory: true}) }
  scope :optionals, -> { joins(:searchable_attribute_category).where(searchable_attribute_categories: {mandatory: false}) }
  scope :test, ->(length) { where("LENGTH(title) > ?", length) }
end
