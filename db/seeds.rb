SearchableAttributeCategory.destroy_all
Org.destroy_all

4.times do |i|
  sc = SearchableAttributeCategory.create(name: "CAT #{i + 1}", mandatory: i == 3 )
  10.times {SearchableAttribute.create(name: "SA #{SearchableAttribute.count + 1}", searchable_attribute_category: sc)}
end

addresses = [
    "63, rue Boursault, 75017 Paris France",
    "32, boulevard Raspail, 75007 Paris France",
    "57, boulevard du Temple, 75011 Paris France",
    "3, rue de Rome, 75008 Paris France",
    "Kensington Gardens, Kensington, London W8 4PX, Royaume-Uni",
    "Westminster, London SW1A 0AA, Royaume-Uni",
    "Silk St, Barbican, London EC2Y 8DS, Royaume-Uni",
    "5800 20th Ave, Brooklyn, NY 11204, États-Unis",
    "350 Coney Island Ave, Brooklyn, NY 11218, États-Unis",
    "71-43 Kissena Blvd, Queens, NY 11367, États-Unis",
]

200.times do |i|
  Org.create(
      name: "Org #{i + 1}",
      searchable_attributes: SearchableAttribute.all.sample(10),
      place_attributes: { address: addresses.sample }
  )
end







