class OutcomesController < ApplicationController
    before_action :set_outcome, only: [:show, :edit, :update, :destroy]

    # GET /outcomes
    # GET /outcomes.json
    def index
        @outcomes = Outcome.all
    end

    # GET /outcomes/1
    # GET /outcomes/1.json
    def show; end

    # GET /outcomes/new
    def new
        @property_id = params[:property_id]
        @outcome = Outcome.new
    end

    # GET /outcomes/1/edit
    def edit; end

    # POST /outcomes
    # POST /outcomes.json
    def create
        @outcome = Outcome.new(outcome_params)

        respond_to do |format|
            if @outcome.save
                format.html { redirect_to @outcome, notice: 'Outcome was successfully created.' }
                format.json { render :show, status: :created, location: @outcome }
            else
                format.html { render :new }
                format.json { render json: @outcome.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /outcomes/1
    # PATCH/PUT /outcomes/1.json
    def update
        respond_to do |format|
            if @outcome.update(outcome_params)
                format.html { redirect_to @outcome, notice: 'Outcome was successfully updated.' }
                format.json { render :show, status: :ok, location: @outcome }
            else
                format.html { render :edit }
                format.json { render json: @outcome.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /outcomes/1
    # DELETE /outcomes/1.json
    def destroy
        @outcome.destroy
        respond_to do |format|
            format.html { redirect_to outcomes_url, notice: 'Outcome was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    ## Custom methods
    def history_outcomes_property
        @property = Property.find(params[:property_id])
        @period_total = 0
    end

    def search_outcomes_property_by_period
        # Create a date to search by period
        date = Date.new(params[:outcomes_period_search]['period(1i)'].to_i, params[:outcomes_period_search]['period(2i)'].to_i, params[:outcomes_period_search]['period(3i)'].to_i)

        # Search by period with previously created date
        @outcomes_property = Outcome.where(:date => date.beginning_of_month..date.end_of_month)
        @period_total = @outcomes_property.sum(:ammount)

        if @outcomes_property
            respond_to do |format|
                format.js
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_outcome
        @outcome = Outcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcome_params
        params.require(:outcome).permit(:date, :outcome_category_id, :property_id, :ammount, :details)
    end
end
