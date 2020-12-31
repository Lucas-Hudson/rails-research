puts "### LANGUAGE SEED ###"

sac = SearchableAttributeCategory.new(name: "Language")
sac.save

languages = [
    "Anglais",
    "Allemand",
    "Néerlandais",
    "Espagnol",
    "Italien",
    "Portugais",
    "Chinois",
    "Russe",
    "Marocain",
    "Roumain",
    "Japonais",
    "Arabe",
    "Français",
    "Américain",
    "Zoulou",
    "Arménien",
    "Turc",
    "Vietnamien",
    "Bulgare",
    "Créole Réunionnais",
    "Polonais",
    "Serbe",
    "Thaïlandais",
    "Créole Guadeloupéen",
    "Camerounais"
]

languages.each do |l|
  SearchableAttribute.create(name: l, searchable_attribute_category: sac)
end
