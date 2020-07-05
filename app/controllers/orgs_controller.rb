class OrgsController < ApplicationController
  before_action :set_org, only: [:show, :edit, :update, :destroy]
  
  def index
    @orgs = params[:q].present? ? Org.joins(:place).near(params[:q]) : Org.all
  end

  def show
  end
  
  def new
    @org = Org.new
  end
  
  def edit
  end
  
  def create
    @org = Org.new(org_params)
    respond_to do |format|
      if @org.save
        format.html { redirect_to @org, notice: "Org was successfully created." }
        format.json { render :show, status: :created, location: @org }
      else
        format.html { render :new }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @org.update(org_params)
        format.html { redirect_to @org, notice: "Org was successfully updated." }
        format.json { render :show, status: :ok, location: @org }
      else
        format.html { render :edit }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @org.destroy
    respond_to do |format|
      format.html { redirect_to orgs_url, notice: "Org was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_org
      @org = Org.find(params[:id])
    end

    def org_params
      params.require(:org).permit(:name, place_attributes: [:address, :latitude, :longitude])
    end
end
