class AddMandatoryToSearchableAttributeCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :searchable_attribute_categories, :mandatory, :boolean, default: false
  end
end
