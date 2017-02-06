class ElectricityReadingsController < ApplicationController
  before_action :set_electricity_reading, only: [:show, :edit, :update, :destroy]

  # GET /electricity_readings
  # GET /electricity_readings.json
  def index
    @electricity_readings = ElectricityReading.all
  end

  # GET /electricity_readings/1
  # GET /electricity_readings/1.json
  def show
  end

  # GET /electricity_readings/new
  def new
    @electricity_reading = ElectricityReading.new

    if params[:subunit_id]
      @subunit = Subunit.find(params[:subunit_id])
      @property = @subunit.property
    end
  end

  # GET /electricity_readings/1/edit
  def edit
  end

  # POST /electricity_readings
  # POST /electricity_readings.json
  def create
    @electricity_reading = ElectricityReading.new(electricity_reading_params)

    respond_to do |format|
      if @electricity_reading.save
        format.html { redirect_to @electricity_reading, notice: 'Electricity reading was successfully created.' }
        format.json { render :show, status: :created, location: @electricity_reading }
      else
        format.html { render :new }
        format.json { render json: @electricity_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electricity_readings/1
  # PATCH/PUT /electricity_readings/1.json
  def update
    respond_to do |format|
      if @electricity_reading.update(electricity_reading_params)
        format.html { redirect_to @electricity_reading, notice: 'Electricity reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @electricity_reading }
      else
        format.html { render :edit }
        format.json { render json: @electricity_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electricity_readings/1
  # DELETE /electricity_readings/1.json
  def destroy
    @electricity_reading.destroy
    respond_to do |format|
      format.html { redirect_to electricity_readings_url, notice: 'Electricity reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electricity_reading
      @electricity_reading = ElectricityReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def electricity_reading_params
      params.require(:electricity_reading).permit(:subunit_id, :property_id, :period, :total_reading)
    end
end
