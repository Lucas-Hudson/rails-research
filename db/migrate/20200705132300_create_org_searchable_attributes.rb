class CreateOrgSearchableAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :org_searchable_attributes do |t|
      t.belongs_to :org
      t.belongs_to :searchable_attribute

      t.timestamps
    end
  end
end
