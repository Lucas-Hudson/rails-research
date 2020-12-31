namespace :search do
  task bench: :environment do
    filters = SearchableAttribute.all.pluck(:slug)

    Benchmark.bmbm do |x|
      x.report("0:")   { Search.new.results }
      x.report("5:")   { Search.new(filters: filters.sample(5)).results }
      x.report("10:")   { Search.new(filters: filters.sample(10)).results }
    end
  end
end
