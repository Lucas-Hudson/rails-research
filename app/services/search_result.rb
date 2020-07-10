class SearchResult
  def initialize(params: params)
    @params = params
    @params[:filters] = @params[:filters]&.split("/")&.flatten
    @results = Org.all
    @mandatory_filters = nil
    @optional_filters = nil
  end

  def results
    return @results if no_filters?
    @results = filter_by_location if @params[:place].present?
    @results = filter_by_attributes if @params[:filters]
    @results
  end

  def filter_by_location
    @results = @results.joins(:place).near(@params[:place])
  end

  def filter_by_attributes
    sort_filters
    filter_mandatories
    filter_optionals
    puts "#" * 100
    puts @params
    puts "mandatory_filters"
    puts @mandatory_filters
    puts "optional_filters"
    puts @optional_filters
    puts "results"
    puts @results
    puts "#" * 100
    @results
  end

  def filter_mandatories
    @mandatory_filters.each do |f|
      @results = Org.union.intersect(@results, Org.joins(:searchable_attributes).where(searchable_attributes: {id: f}))
    end
  end

  def filter_optionals
    @results = @results.joins(:searchable_attributes).where(searchable_attributes: {id: @optional_filters})
  end

  def no_filters?
    @params[:place].nil? && @params[:filters].nil?
  end

  def sort_filters
    @mandatory_filters = SearchableAttribute.mandatories.where(id: [@params[:filters]]).pluck(:id)
    @optional_filters = SearchableAttribute.optionals.where(id: [@params[:filters]]).pluck(:id)
  end
end
