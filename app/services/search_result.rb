class SearchResult
  def initialize(params: params)
    @params = params
    @results = Org.all
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
    @results.joins(:searchable_attributes).where(searchable_attributes: { id: @params[:filters].split("/").flatten })
  end

  def no_filters?
    @params[:place].nil? && @params[:filters].nil?
  end
end
