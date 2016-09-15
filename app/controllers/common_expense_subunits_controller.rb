class CommonExpenseSubunitsController < ApplicationController
  before_action :set_common_expense_subunit, only: [:show, :edit, :update, :destroy]

  # GET /common_expense_subunits
  # GET /common_expense_subunits.json
  def index
    @common_expense_subunits = CommonExpenseSubunit.all
  end

  # GET /common_expense_subunits/1
  # GET /common_expense_subunits/1.json
  def show
  end

  # GET /common_expense_subunits/new
  def new
    @common_expense_subunit = CommonExpenseSubunit.new
  end

  # GET /common_expense_subunits/1/edit
  def edit
  end

  # POST /common_expense_subunits
  # POST /common_expense_subunits.json
  def create
    @common_expense_subunit = CommonExpenseSubunit.new(common_expense_subunit_params)

    respond_to do |format|
      if @common_expense_subunit.save
        format.html { redirect_to @common_expense_subunit, notice: 'Common expense subunit was successfully created.' }
        format.json { render :show, status: :created, location: @common_expense_subunit }
      else
        format.html { render :new }
        format.json { render json: @common_expense_subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common_expense_subunits/1
  # PATCH/PUT /common_expense_subunits/1.json
  def update
    respond_to do |format|
      if @common_expense_subunit.update(common_expense_subunit_params)
        format.html { redirect_to @common_expense_subunit, notice: 'Common expense subunit was successfully updated.' }
        format.json { render :show, status: :ok, location: @common_expense_subunit }
      else
        format.html { render :edit }
        format.json { render json: @common_expense_subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_expense_subunits/1
  # DELETE /common_expense_subunits/1.json
  def destroy
    @common_expense_subunit.destroy
    respond_to do |format|
      format.html { redirect_to common_expense_subunits_url, notice: 'Common expense subunit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_expense_subunit
      @common_expense_subunit = CommonExpenseSubunit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_expense_subunit_params
      params.require(:common_expense_subunit).permit(:subunit_id, :electricity_charge, :water_charge, :gas_charge, :others_charge)
    end
end