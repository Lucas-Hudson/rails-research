puts "### ORG SEED ###"

professions = SearchableAttributeCategory.find_by(slug: "profession").searchable_attributes
professions_range = 1..2
sectors = SearchableAttributeCategory.find_by(slug: "sector").searchable_attributes
sectors_range = 1..(sectors.count / 2)
skills = SearchableAttributeCategory.find_by(slug: "skill").searchable_attributes
skills_range = 1..(skills.count / 2)
languages = SearchableAttributeCategory.find_by(slug: "language").searchable_attributes
languages_range = 1..(languages.count / 2)
count = 0

SEED_COUNT.times do |i|
  count += 1

  org = Org.new(name: Faker::Company.unique.name)
  org.place = Place.all[count]
  org.searchable_attributes += professions.sample(rand(professions_range))
  org.searchable_attributes += sectors.sample(rand(sectors_range))
  org.searchable_attributes += skills.sample(rand(skills_range))
  org.searchable_attributes += languages.sample(rand(languages_range))

  org.save

  count = 0 if count == Place.all.count
end
