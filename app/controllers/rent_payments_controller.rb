class RentPaymentsController < ApplicationController
  before_action :set_rent_payment, only: [:show, :edit, :update, :destroy]

  # GET /rent_payments
  # GET /rent_payments.json
  def index
    @rent_payments = RentPayment.all
  end

  # GET /rent_payments/1
  # GET /rent_payments/1.json
  def show
  end

  # GET /rent_payments/new
  def new
    @subunit_rent = SubunitRent.find(subunit_rent_id = params[:subunit_rent_id])
    @rent_payment = RentPayment.new
  end

  # GET /rent_payments/1/edit
  def edit
  end

  # POST /rent_payments
  # POST /rent_payments.json
  def create
    @rent_payment = RentPayment.new(rent_payment_params)

    respond_to do |format|
      if @rent_payment.save

        @rent_payment.subunit_rent.payed = true
        @rent_payment.subunit_rent.save!

        format.html { redirect_to subunit_path(@rent_payment.subunit), notice: 'Rent payment was successfully created.' }
        format.json { render :show, status: :created, location: @rent_payment }
      else
        format.html { render :new }
        format.json { render json: @rent_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rent_payments/1
  # PATCH/PUT /rent_payments/1.json
  def update
    respond_to do |format|
      if @rent_payment.update(rent_payment_params)
        format.html { redirect_to subunit_path(@rent_payment.subunit), notice: 'Rent payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent_payment }
      else
        format.html { render :edit }
        format.json { render json: @rent_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_payments/1
  # DELETE /rent_payments/1.json
  def destroy
    ## Get the id of subunit in order to redirect once payment is deleted
    subunit = @rent_payment.subunit

    ## As payment is being deleted, change status of rent charge to false
    subunit_rent = @rent_payment.subunit_rent
    subunit_rent.payed = false
    subunit_rent.save!

    ## Destroy the payment
    @rent_payment.destroy

    respond_to do |format|
      format.html { redirect_to subunit_path(subunit), notice: 'Rent payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent_payment
      @rent_payment = RentPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_payment_params
      params.require(:rent_payment).permit(:renter_id, :subunit_id, :amount, :payment_method_id, :subunit_rent_id, :receipt_number, :payment_date)
    end
end
