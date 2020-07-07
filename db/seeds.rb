SearchableAttributeCategory.destroy_all
# Org.destroy_all
#
# addresses = [
#     "63, rue Boursault, 75017 Paris France",
#     "32, boulevard Raspail, 75007 Paris France",
#     "57, boulevard du Temple, 75011 Paris France",
#     "3, rue de Rome, 75008 Paris France",
#     "Kensington Gardens, Kensington, London W8 4PX, Royaume-Uni",
#     "Westminster, London SW1A 0AA, Royaume-Uni",
#     "Silk St, Barbican, London EC2Y 8DS, Royaume-Uni",
#     "5800 20th Ave, Brooklyn, NY 11204, États-Unis",
#     "350 Coney Island Ave, Brooklyn, NY 11218, États-Unis",
#     "71-43 Kissena Blvd, Queens, NY 11367, États-Unis",
# ]
#
# 10.times { |i| Org.create(name: Faker::Name.name, place_attributes: { address: addresses[i]}) }
#

cat1 = SearchableAttributeCategory.create(name: "Profession")
5.times { SearchableAttribute.create(searchable_attribute_category: cat1, name: Faker::Company.industry)}

cat2 = SearchableAttributeCategory.create(name: "Gender")
5.times { SearchableAttribute.create(searchable_attribute_category: cat2, name: Faker::Gender.type)}

cat3 = SearchableAttributeCategory.create(name: "Accepted currrency")
5.times { SearchableAttribute.create(searchable_attribute_category: cat3, name: Faker::Currency.symbol)}


Org.all.each { |o| o.searchable_attributes = SearchableAttribute.all.sample(5) }




