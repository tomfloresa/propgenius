class CommonExpensePaymentsController < ApplicationController
  before_action :set_common_expense_payment, only: [:show, :edit, :update, :destroy]

  # GET /common_expense_payments
  # GET /common_expense_payments.json
  def index
    @common_expense_payments = CommonExpensePayment.all
  end

  # GET /common_expense_payments/1
  # GET /common_expense_payments/1.json
  def show
  end

  # GET /common_expense_payments/new
  def new
    @common_expense_subunit = CommonExpenseSubunit.find(params[:common_expense_subunit_id])
    @common_expense_payment = CommonExpensePayment.new
  end

  # GET /common_expense_payments/1/edit
  def edit
  end

  # POST /common_expense_payments
  # POST /common_expense_payments.json
  def create
    @common_expense_payment = CommonExpensePayment.new(common_expense_payment_params)

    respond_to do |format|
      if @common_expense_payment.save

        @common_expense_payment.common_expense_subunit.payed = true
        @common_expense_payment.common_expense_subunit.save!

        format.html { redirect_to subunit_path(@common_expense_payment.subunit), notice: 'Common expense payment was successfully created.' }
        format.json { render :show, status: :created, location: @common_expense_payment }
      else
        format.html { render :new }
        format.json { render json: @common_expense_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common_expense_payments/1
  # PATCH/PUT /common_expense_payments/1.json
  def update
    respond_to do |format|
      if @common_expense_payment.update(common_expense_payment_params)
        format.html { redirect_to @common_expense_payment, notice: 'Common expense payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @common_expense_payment }
      else
        format.html { render :edit }
        format.json { render json: @common_expense_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_expense_payments/1
  # DELETE /common_expense_payments/1.json
  def destroy
    ## Get the id of subunit in order to redirect once payment is deleted
    subunit = @common_expense_payment.subunit

    ## As payment is being deleted, change status of common expense charge to false
    common_expense_subunit = @common_expense_payment.common_expense_subunit
    common_expense_subunit.payed = false
    common_expense_subunit.save!

    @common_expense_payment.destroy
    respond_to do |format|
      format.html { redirect_to subunit_path(subunit), notice: 'Common expense payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_expense_payment
      @common_expense_payment = CommonExpensePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_expense_payment_params
      params.require(:common_expense_payment).permit(:renter_id, :subunit_id, :amount, :payment_method_id, :common_expense_subunit_id, :receipt_number, :payment_date)
    end
end
