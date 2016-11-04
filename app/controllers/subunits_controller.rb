class SubunitsController < ApplicationController
  before_action :set_subunit, only: [:show, :edit, :update, :destroy]

  # GET /subunits
  # GET /subunits.json
  def index
    @subunits = Subunit.all
  end

  # GET /subunits/1
  # GET /subunits/1.json
  def show
    id = params[:id]
    @common_expenses = CommonExpenseSubunit.where(subunit_id: id)
  end

  # GET /subunits/new
  def new
    @subunit = Subunit.new
  end

  # GET /subunits/1/edit
  def edit
  end

  # POST /subunits
  # POST /subunits.json
  def create
    @subunit = Subunit.new(subunit_params)

    respond_to do |format|
      if @subunit.save
        redirect_to property_path(@subunit.property.id)
        return
      else
        format.html { render :new }
        format.json { render json: @subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subunits/1
  # PATCH/PUT /subunits/1.json
  def update
    respond_to do |format|
      if @subunit.update(subunit_params)
        format.html { redirect_to @subunit, notice: 'Subunit was successfully updated.' }
        format.json { render :show, status: :ok, location: @subunit }
      else
        format.html { render :edit }
        format.json { render json: @subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subunits/1
  # DELETE /subunits/1.json
  def destroy
    @subunit.destroy
    respond_to do |format|
      format.html { redirect_to subunits_url, notice: 'Subunit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subunit
      @subunit = Subunit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subunit_params
      params.require(:subunit).permit(:square_meters, :property_type_id, :renter_id, :rent_value, :number, :lease_startdate, :owner_id, :property_id, :proration_percentage)
    end
end
