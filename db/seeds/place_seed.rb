require "csv"

puts "### PLACE SEED ###"

csv_text = File.read("db/seeds/csv/places.csv")
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  Place.create(row.to_hash)
end
