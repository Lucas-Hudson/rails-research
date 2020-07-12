class SearchResult
  def initialize(filters)
    @filters = filters&.split("/")&.flatten
    @place = nil
    @mandatory_filters = nil
    @optional_filters = nil
    @results = Org.all
  end

  def results
    return @results unless @filters
    sort_filters
    @results = filter_by_attributes if @mandatory_filters || @optional_filters
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
      @mandatory_filters = SearchableAttribute.mandatories.where(slug: [@filters]).pluck(:id)
      @optional_filters = SearchableAttribute.optionals.where(slug: [@filters]).group_by(&:searchable_attribute_category).map {|k,v| v.pluck(:id)}
    end

    def filter_by_location
      @results = @results.joins(:place).near(@place)
    end

    def filter_by_attributes
      filter_by_mandatories if @mandatory_filters.present?
      filter_by_optionals if @optional_filters.present?
      @results
    end

    def filter_by_mandatories
      @mandatory_filters.each do |f|
        @results = Org.union.intersect(@results, Org.joins(:searchable_attributes).where(searchable_attributes: {id: f}))
      end
    end

    def filter_by_optionals
      @optional_filters.each do |f|
        @results = Org.union.intersect(@results, Org.joins(:searchable_attributes).where(searchable_attributes: {id: f}))
      end
    end
end
