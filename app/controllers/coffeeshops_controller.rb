class CoffeeshopsController < ApplicationController
  before_action :set_coffeeshop, only: [:show, :edit, :update, :destroy]

  # GET /coffeeshops
  # GET /coffeeshops.json
  def index
    @coffeeshops = Coffeeshop.all
    @all_coffeeshops = @coffeeshops

    #@avgrating = Coffeeshop.average_rating

    facilities = params[:facilities]
    address    = params[:search]
    @lat       = params[:lat]
    @lng       = params[:lng]

    # Get actual address from address


    # this should be a method in the model and then the method is called here and assigned to an instance variable
    if facilities.present?
      facilities.each do |facility|
        @coffeeshops = @coffeeshops & Coffeeshop.joins(:facilities).where(facilities: { name: facility })
      end
    end
  
    @coffeeshops = @coffeeshops & Coffeeshop.near([@lat, @lng]) if @lat.present? && @lng.present?  
    
    end

   def show
    @coffeeshop = Coffeeshop.find(params[:id])
    @reviews = @coffeeshop.reviews
  end

  # GET /coffeeshops/new
  def new
    @coffeeshop = Coffeeshop.new
  end

  # GET /coffeeshops/1/edit
  def edit
  end

  # POST /coffeeshops
  # POST /coffeeshops.json
  def create
    @coffeeshop = current_user.coffeeshops.new(coffeeshop_params)
    
    coffeeshop_facilities = params[:coffeeshop].delete(:facilities)
    @coffeeshop.facility_ids = coffeeshop_facilities

    respond_to do |format|
      if @coffeeshop.save
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully created.' }
        format.json { render :show, status: :created, location: @coffeeshop }
      else
        format.html { render :new }
        format.json { render json: @coffeeshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffeeshops/1
  # PATCH/PUT /coffeeshops/1.json
  def update
    coffeeshop_facilities = params[:coffeeshop].delete(:facilities)
    @coffeeshop.facility_ids = coffeeshop_facilities

    respond_to do |format|
      if @coffeeshop.update(coffeeshop_params)
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffeeshop }
      else
        format.html { render :edit }
        format.json { render json: @coffeeshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffeeshops/1
  # DELETE /coffeeshops/1.json
  def destroy
    @coffeeshop.destroy
    respond_to do |format|
      format.html { redirect_to coffeeshops_url, notice: 'Coffeeshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffeeshop
      @coffeeshop = Coffeeshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffeeshop_params
      params.require(:coffeeshop).permit(:name, :latitude, :longitude, :address, 
        :description, :picture, :user_id, :facility)
    end
end
