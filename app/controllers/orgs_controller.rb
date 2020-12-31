class OrgsController < ApplicationController
  before_action :sort_filters, only: [:index]

  def index
    search = Search.new(place: @place, filters: @filters)
    @orgs = search.results.page(params[:page])
    @searchable_categories = SearchableAttributeCategory.all
  end

  def show
    @org = Org.find_by(slug: params[:id])

    redirect_to root_path unless @org
  end

  private
    def sort_filters
      @filters = params[:filters].present? ? params[:filters].split("/")&.flatten : nil

      if @filters
        filter = SearchableAttribute.find_by(slug: @filters.first)
        @place = filter.present? ? nil : @filters.first.split("-").join(" ")
      end

      @filters.shift if @place
    end
end
