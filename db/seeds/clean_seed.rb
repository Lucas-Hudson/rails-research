puts "### CLEAN SEED ###"

SearchableAttributeCategory.destroy_all
Org.destroy_all
Place.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
