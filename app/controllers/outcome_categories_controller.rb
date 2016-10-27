class OutcomeCategoriesController < ApplicationController
  before_action :set_outcome_category, only: [:show, :edit, :update, :destroy]

  # GET /outcome_categories
  # GET /outcome_categories.json
  def index
    @outcome_categories = OutcomeCategory.all
  end

  # GET /outcome_categories/1
  # GET /outcome_categories/1.json
  def show
  end

  # GET /outcome_categories/new
  def new
    @outcome_category = OutcomeCategory.new
  end

  # GET /outcome_categories/1/edit
  def edit
  end

  # POST /outcome_categories
  # POST /outcome_categories.json
  def create
    @outcome_category = OutcomeCategory.new(outcome_category_params)

    respond_to do |format|
      if @outcome_category.save
        format.html { redirect_to @outcome_category, notice: 'Outcome category was successfully created.' }
        format.json { render :show, status: :created, location: @outcome_category }
      else
        format.html { render :new }
        format.json { render json: @outcome_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcome_categories/1
  # PATCH/PUT /outcome_categories/1.json
  def update
    respond_to do |format|
      if @outcome_category.update(outcome_category_params)
        format.html { redirect_to @outcome_category, notice: 'Outcome category was successfully updated.' }
        format.json { render :show, status: :ok, location: @outcome_category }
      else
        format.html { render :edit }
        format.json { render json: @outcome_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcome_categories/1
  # DELETE /outcome_categories/1.json
  def destroy
    @outcome_category.destroy
    respond_to do |format|
      format.html { redirect_to outcome_categories_url, notice: 'Outcome category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome_category
      @outcome_category = OutcomeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcome_category_params
      params.require(:outcome_category).permit(:name)
    end
end
