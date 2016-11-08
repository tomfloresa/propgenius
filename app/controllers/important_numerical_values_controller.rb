class ImportantNumericalValuesController < ApplicationController
  before_action :set_important_numerical_value, only: [:show, :edit, :update, :destroy]

  # GET /important_numerical_values
  # GET /important_numerical_values.json
  def index
    @important_numerical_values = ImportantNumericalValue.all
  end

  # GET /important_numerical_values/1
  # GET /important_numerical_values/1.json
  def show
  end

  # GET /important_numerical_values/new
  def new
    @important_numerical_value = ImportantNumericalValue.new
  end

  # GET /important_numerical_values/1/edit
  def edit
  end

  # POST /important_numerical_values
  # POST /important_numerical_values.json
  def create
    @important_numerical_value = ImportantNumericalValue.new(important_numerical_value_params)

    respond_to do |format|
      if @important_numerical_value.save
        format.html { redirect_to @important_numerical_value, notice: 'Important numerical value was successfully created.' }
        format.json { render :show, status: :created, location: @important_numerical_value }
      else
        format.html { render :new }
        format.json { render json: @important_numerical_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /important_numerical_values/1
  # PATCH/PUT /important_numerical_values/1.json
  def update
    respond_to do |format|
      if @important_numerical_value.update(important_numerical_value_params)
        format.html { redirect_to @important_numerical_value, notice: 'Important numerical value was successfully updated.' }
        format.json { render :show, status: :ok, location: @important_numerical_value }
      else
        format.html { render :edit }
        format.json { render json: @important_numerical_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /important_numerical_values/1
  # DELETE /important_numerical_values/1.json
  def destroy
    @important_numerical_value.destroy
    respond_to do |format|
      format.html { redirect_to important_numerical_values_url, notice: 'Important numerical value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_important_numerical_value
      @important_numerical_value = ImportantNumericalValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def important_numerical_value_params
      params.require(:important_numerical_value).permit(:name, :value)
    end
end
