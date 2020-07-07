class OrgSearchableAttribute < ApplicationRecord
  belongs_to :org
  belongs_to :searchable_attribute
end
