class Search
  def initialize(place: nil, filters: nil)
    @place = place
    @filters = filters
    @attributes = []
    @results = Org.all
  end

  def results
    return @results unless @filters || @place

    sort_filters
    filter_by_attributes if @attributes
    filter_by_place if @place

    @results
  end

  private
    def sort_filters
      mandatory_filters = SearchableAttribute.mandatories.where(slug: [@filters]).pluck(:id)
      optional_filters = SearchableAttribute.
          optionals.
          where(slug: [@filters]).
          group_by(&:searchable_attribute_category).
          map { |k, v| v.pluck(:id) }

      @attributes = mandatory_filters + optional_filters
    end

    def filter_by_attributes
      @attributes.each do |f|
        @results = Org.union.intersect(@results, Org.joins(:searchable_attributes).where(searchable_attributes: {id: f}))
      end
    end

    def filter_by_place
      @results = @results.joins(:place).near(@place)
    end
end
