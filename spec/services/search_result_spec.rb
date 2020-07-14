require "rails_helper"

RSpec.describe "Search Result" do

  before(:each) do
    3.times do |i|
      sc = SearchableAttributeCategory.new(name: "CAT #{i + 1}", mandatory: i == 0 )
      5.times {SearchableAttribute.create(name: "SA #{SearchableAttribute.count + 1}", searchable_attribute_category: sc)}
    end

    10.times do |i|
      Org.create(
          name: "Org #{i + 1}",
          searchable_attributes: SearchableAttribute.all.sample(10),
      )
    end
  end

  context "validation" do

    describe "#results" do
      it "should return all orgs if no arguments" do
        search = SearchResult.new().results
        expect(search.count).to eq(Org.all.count)
      end
    end

    describe "#results" do
      it "should return all orgs if arguments are nil" do
        search = SearchResult.new(nil).results
        expect(search.count).to eq(Org.all.count)
      end
    end

    describe "#results" do
      it "should return all orgs if arguments is a hash" do
        search = SearchResult.new({}).results
        expect(search.count).to eq(Org.all.count)
      end
    end

    describe "#results" do
      it "should filter results if arguments are a valid string" do
        search = SearchResult.new(SearchableAttribute.all.sample(5).pluck(:slug).join("/")).results
        expect(search.count).to be < Org.all.count
      end
    end

    describe "#results" do
      it "should filter results if argument is an array" do
        search = SearchResult.new(SearchableAttribute.all.sample(5).pluck(:slug)).results
        expect(search.count).to be < Org.all.count
      end
    end
  end
end
