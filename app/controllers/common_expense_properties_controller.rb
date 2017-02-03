class CommonExpensePropertiesController < ApplicationController
    before_action :set_common_expense_property, only: [:show, :edit, :update, :destroy]

    # GET /common_expense_properties
    # GET /common_expense_properties.json
    def index
        @common_expense_properties = CommonExpenseProperty.all
    end

    # GET /common_expense_properties/1
    # GET /common_expense_properties/1.json
    def show; end

    # GET /common_expense_properties/new
    def new
        @common_expense_property = CommonExpenseProperty.new
    end

    # GET /common_expense_properties/1/edit
    def edit; end

    # POST /common_expense_properties
    # POST /common_expense_properties.json
    def create
        @common_expense_property = CommonExpenseProperty.new(common_expense_property_params)

        respond_to do |format|
            if @common_expense_property.save
                if params[:generate_for_subunits]
                    # If the common expense for the property is created, get all the subunutis of the property itself
                    subunits = @common_expense_property.property.subunits

                    # For every subunit conforming the property, create a subunit common expense
                    subunits.each do |s|
                        @ces = CommonExpenseSubunit.new
                        @ces.subunit_id = s.id
                        @ces.common_expense_property_id = @common_expense_property.id
                        @ces.electricity_charge = @common_expense_property.electricity * s.proration_percentage
                        @ces.water_charge = @common_expense_property.water * s.proration_percentage
                        @ces.gas_charge = @common_expense_property.gas * s.proration_percentage
                        @ces.others_charge = @common_expense_property.others * s.proration_percentage
                        @ces.salary_payments = @common_expense_property.salary_payments * s.proration_percentage
                        @ces.maintenance_payments = @common_expense_property.maintenance_payments * s.proration_percentage
                        @ces.period = @common_expense_property.period
                        @ces.payed = false
                        @ces.total = (@common_expense_property.electricity * s.proration_percentage) +
                                     (@common_expense_property.water * s.proration_percentage) +
                                     (@common_expense_property.gas * s.proration_percentage) +
                                     (@common_expense_property.others * s.proration_percentage) +
                                     (@common_expense_property.salary_payments * s.proration_percentage) +
                                     (@common_expense_property.maintenance_payments * s.proration_percentage)
                        @ces.save!
                        @renter = s.renter

                        # create a pdf from a string
                        @pdf_string = render_to_string template: 'administrators/pdf_common_expense_charge.html.erb', layout: 'layouts/pdf.html.erb', encoding: 'utf-8'

                        # When the common expense is saved, send mail to renter
                        GeneratedCommonExpenseJob.set(wait: 5.seconds).perform_later(@renter, @pdf_string, @common_expense_property, @ces)
                    end
                end
                format.html { redirect_to property_path(@common_expense_property.property.id), notice: 'Common expense property was successfully created.' }
                format.json { render :show, status: :created, location: @common_expense_property }
            else
                format.html { render :new }
                format.json { render json: @common_expense_property.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /common_expense_properties/1
    # PATCH/PUT /common_expense_properties/1.json
    def update
        respond_to do |format|
            if @common_expense_property.update(common_expense_property_params)
                format.html { redirect_to @common_expense_property, notice: 'Common expense property was successfully updated.' }
                format.json { render :show, status: :ok, location: @common_expense_property }
            else
                format.html { render :edit }
                format.json { render json: @common_expense_property.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /common_expense_properties/1
    # DELETE /common_expense_properties/1.json
    def destroy
        @common_expense_property.destroy
        respond_to do |format|
            format.html { redirect_to common_expense_properties_url, notice: 'Common expense property was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    ## Custom methods
    def history_common_expenses_property
        @property = Property.find(params[:property_id])
    end

    def search_common_expense_property_by_period
        # Create a date to search by period
        date = Date.new(params[:ce_period_search]['period(1i)'].to_i, params[:ce_period_search]['period(2i)'].to_i, params[:ce_period_search]['period(3i)'].to_i)
        # Search by period with previously created date
        @common_expense_property = CommonExpenseProperty.find_by(period: date)

        if @common_expense_property
            respond_to do |format|
                format.js
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_common_expense_property
        @common_expense_property = CommonExpenseProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_expense_property_params
        params.require(:common_expense_property).permit(:property_id, :water, :gas, :electricity, :others, :details, :period, :salary_payments, :maintenance_payments, :total)
    end
end
