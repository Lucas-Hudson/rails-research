class SearchResult
  def initialize(params: params)
    @params = params
    @params[:filters] = @params[:filters]&.split("/")&.flatten
    @results = Org.all
    @mandatory_ids = []
  end

  def mandatory_filter_ids
    a = SearchableAttribute.joins(:searchable_attribute_category).where(searchable_attribute_categories: { mandatory: true }).pluck(:id)
    b = @params[:filters].map { |x| x.to_i}
    a & b
  end

  def results
    return @results if no_filters?
    @results = filter_by_location if @params[:place].present?
    @results = filter_by_attributes if @params[:filters]
    @results
  end

  def filter_by_location
    @results.joins(:place).near(@params[:place])
  end

  def filter_by_attributes
    @results.joins(:searchable_attributes).where(searchable_attributes: { id: @params[:filters] })
    # filter_optional
    # filter_mandatories
    # @results
  end

  def filter_mandatories
    mandatory_filter_ids.each do |m|
      @results = @results.joins(:searchable_attributes).where(searchable_attributes: { id: m })
      # @results = Org.where(id: @results.pluck(:id))
    end
  end

  def filter_optional
    @results = @results.joins(:searchable_attributes).where(searchable_attributes: { id: @params[:filters] - mandatory_filter_ids })
  end

  def no_filters?
    @params[:place].nil? && @params[:filters].nil?
  end
end
