class CreateSearchableAttributeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :searchable_attribute_categories do |t|
      t.string :name
      t.string :slug
      t.boolean :mandatory, default: false

      t.timestamps
    end
  end
end
