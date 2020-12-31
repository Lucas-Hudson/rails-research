class CreateJoinTableOrgPlaces < ActiveRecord::Migration[6.0]
  def change
    create_join_table :org, :places do |t|
      t.index [:org_id, :place_id]
      t.index [:place_id, :org_id]
    end
  end
end
