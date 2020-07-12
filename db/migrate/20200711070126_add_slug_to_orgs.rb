class AddSlugToOrgs < ActiveRecord::Migration[6.0]
  def change
    add_column :orgs, :slug, :string
    add_index :orgs, :slug, unique: true
  end
end
