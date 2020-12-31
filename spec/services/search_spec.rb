require "rails_helper"
require "csv"

RSpec.describe Search, type: :service do

  before(:all) do
    path = Rails.root.join("db", "seeds")

    load("#{path}/profession_seed.rb")
    load("#{path}/sector_seed.rb")
    load("#{path}/skill_seed.rb")
    load("#{path}/language_seed.rb")

    seed_count = 5

    csv_text = File.read("db/seeds/csv/places.csv")
    csv = CSV.parse(csv_text, headers: true)

    seed_count.times { |i| Place.create(csv[i].to_hash) }

    seed_count.times do |i|
      org = Org.new(name: i + 1)
      org.place = Place.all[i]
      org.searchable_attributes += SearchableAttribute.all.sample(5)

      org.save
    end
  end

  context "validation" do
    describe "#results" do
      it "should return all orgs if no arguments" do
        search = Search.new.results
        expect(search.count).to eq(Org.all.count)
      end
    end

    describe "#results" do
      it "should filter results if filters is an array of valid slugs" do
        search = Search.new(filters: SearchableAttribute.all.sample(5).pluck(:slug)).results
        expect(search.count).to be < Org.all.count
      end
    end
  end
end
