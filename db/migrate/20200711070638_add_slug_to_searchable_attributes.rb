class AddSlugToSearchableAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :searchable_attributes, :slug, :string
    add_index :searchable_attributes, :slug, unique: true
  end
end
