class CreateSearchableAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :searchable_attributes do |t|
      t.belongs_to :searchable_attribute_category
      t.string :name

      t.timestamps
    end
  end
end
