puts "### PROFESSION SEED ###"

sac = SearchableAttributeCategory.new(name: "Profession", mandatory: true)
sac.save

SearchableAttribute.create(name: "Expert-comptable", searchable_attribute_category: sac)
SearchableAttribute.create(name: "Commissaire aux comptes", searchable_attribute_category: sac)
