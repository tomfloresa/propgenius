class CommonExpensePropertiesController < ApplicationController
  before_action :set_common_expense_property, only: [:show, :edit, :update, :destroy]

  # GET /common_expense_properties
  # GET /common_expense_properties.json
  def index
    @common_expense_properties = CommonExpenseProperty.all
  end

  # GET /common_expense_properties/1
  # GET /common_expense_properties/1.json
  def show
  end

  # GET /common_expense_properties/new
  def new
    @common_expense_property = CommonExpenseProperty.new
  end

  # GET /common_expense_properties/1/edit
  def edit
  end

  # POST /common_expense_properties
  # POST /common_expense_properties.json
  def create
    @common_expense_property = CommonExpenseProperty.new(common_expense_property_params)

    respond_to do |format|
      if @common_expense_property.save
        format.html { redirect_to @common_expense_property, notice: 'Common expense property was successfully created.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_expense_property
      @common_expense_property = CommonExpenseProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_expense_property_params
      params.require(:common_expense_property).permit(:property_id, :water, :gas, :electricity, :others, :details)
    end
end
