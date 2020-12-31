class OrgPlace < ApplicationRecord
  belongs_to :org
  belongs_to :place
end
