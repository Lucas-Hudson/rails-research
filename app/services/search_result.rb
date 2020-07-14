class SearchResult
  def initialize(filters = nil)
    @filters = filters.respond_to?(:split) ? filters&.split("/")&.flatten : nil
    @place = nil
    @attributes = []
    @results = Org.all
  end

  def results
    return @results unless @filters
    sort_filters
    @results = filter_by_attributes if @attributes
    @results = filter_by_location if @place
    @results
  end

  def get_place
    return @place unless @filters
    @place = SearchableAttribute.find_by(slug: @filters.first) ? nil : @filters.first
  end

  private
    def sort_filters
      get_place
      mandatory_filters = SearchableAttribute.mandatories.where(slug: [@filters]).pluck(:id)
      optional_filters = SearchableAttribute.
          optionals.
          where(slug: [@filters]).
          group_by(&:searchable_attribute_category).
          map { |k, v| v.pluck(:id) }
      @attributes = mandatory_filters + optional_filters
    end

    def filter_by_location
      @results = @results.joins(:place).near(@place)
    end

    def filter_by_attributes
      @attributes.each do |f|
        @results = Org.union.intersect(@results, Org.joins(:searchable_attributes).where(searchable_attributes: {id: f}))
      end
      @results
    end
end
