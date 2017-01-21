class SubunitRentsController < ApplicationController
  before_action :set_subunit_rent, only: [:show, :edit, :update, :destroy]

  # GET /subunit_rents
  # GET /subunit_rents.json
  def index
    @subunit_rents = SubunitRent.all
  end

  # GET /subunit_rents/1
  # GET /subunit_rents/1.json
  def show
  end

  # GET /subunit_rents/new
  def new
    @subunit_rent = SubunitRent.new
    @subunit = Subunit.find(params[:subunit_id])
    @uf = ImportantNumericalValue.find(1).value
  end

  # GET /subunit_rents/1/edit
  def edit
  end

  # POST /subunit_rents
  # POST /subunit_rents.json
  def create
    @subunit_rent = SubunitRent.new(subunit_rent_params)

    respond_to do |format|
      if @subunit_rent.save
        # create a pdf from a string
        @pdf_string = render_to_string template: "administrators/pdf_rent_charge", layout: "layouts/pdf.html.erb", encoding: "utf-8"

        # When the rent is saved, send mail to renter
        CreatedRentChargeJob.set(wait: 5.seconds).perform_later(@subunit_rent.subunit.renter, @subunit_rent, @subunit_rent.subunit.property, @pdf_string)

        format.html { redirect_to subunit_path(@subunit_rent.subunit), notice: 'Subunit rent was successfully created.' }
        format.json { render :show, status: :created, location: @subunit_rent }
      else
        format.html { render :new }
        format.json { render json: @subunit_rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subunit_rents/1
  # PATCH/PUT /subunit_rents/1.json
  def update
    respond_to do |format|
      if @subunit_rent.update(subunit_rent_params)
        format.html { redirect_to @subunit_rent, notice: 'Subunit rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @subunit_rent }
      else
        format.html { render :edit }
        format.json { render json: @subunit_rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subunit_rents/1
  # DELETE /subunit_rents/1.json
  def destroy
    @subunit_rent.destroy
    respond_to do |format|
      format.html { redirect_to subunit_rents_url, notice: 'Subunit rent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subunit_rent
      @subunit_rent = SubunitRent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subunit_rent_params
      params.require(:subunit_rent).permit(:subunit_id, :amount, :payed, :period)
    end
end
