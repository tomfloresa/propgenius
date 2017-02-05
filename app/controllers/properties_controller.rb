class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_owner_administrator_renter

    # GET /properties
    # GET /properties.json
    def index
        @properties = Property.all
    end

    # GET /properties/1
    # GET /properties/1.json
    def show
        property_id = params[:id]
        @subunits = Subunit.where(property_id: property_id).order(number: :asc)
        @common_expenses = CommonExpenseProperty.where(property_id: property_id).limit(20).order(created_at: :asc)
        @outcomes = Outcome.where(property_id: property_id).limit(20)

        @common_expenses_within_year = CommonExpenseProperty.where(property_id: property_id)
        @common_expenses_within_year = @common_expenses_within_year.where('created_at >= ?', 1.year.ago)

        @array_of_ce_for_chart = []

        @common_expenses_within_year.each do |c|
            @array_of_ce_for_chart.push(c.total)
        end
    end

    # GET /properties/new
    def new
        @property = Property.new
    end

    # GET /properties/1/edit
    def edit; end

    # POST /properties
    # POST /properties.json
    def create
        @property = Property.new(property_params)

        respond_to do |format|
            if @property.save
                format.html { redirect_to @property, notice: 'Property was successfully created.' }
                format.json { render :show, status: :created, location: @property }
            else
                format.html { render :new }
                format.json { render json: @property.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /properties/1
    # PATCH/PUT /properties/1.json
    def update
        respond_to do |format|
            if @property.update(property_params)
                format.html { redirect_to @property, notice: 'Property was successfully updated.' }
                format.json { render :show, status: :ok, location: @property }
            else
                format.html { render :edit }
                format.json { render json: @property.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /properties/1
    # DELETE /properties/1.json
    def destroy
        @property.destroy
        respond_to do |format|
            format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def register_water_measures_for_subunits
        @property = Property.find(params[:property_id])
        @subunits = @property.subunits
    end

    def create_water_readings_for_subunits
        # Rescue the hash with all the readings generated for property's subunits
        period_readings = params[:period_readings]
        water_readings = params[:water_readings]
        property_id = params[:property_id]

        period_for_readings = Date.new(params[:period_readings]['(1i)'].to_i, params[:period_readings]['(2i)'].to_i)

        # Iterate through each of the elements of the array
        water_readings.each do |w|
            @reading = WaterReading.new
            @reading.subunit_id = (w[:subunit_id]).to_i
            @reading.property_id = property_id
            @reading.period = period_for_readings
            @reading.total_reading = (w[:total_reading]).to_f

            next unless @reading.save!
        end

        redirect_to property_path(property_id)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_property
        @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
        params.require(:property).permit(:address, :square_meters, :property_type_id, :renter_id, :rent_value, :number, :subunits_number, :owner_id, :bank_id, :bank_account_number, :comune_id, :bank_account_type_id)
    end
end
