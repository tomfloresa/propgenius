class BankAccountTypesController < ApplicationController
  before_action :set_bank_account_type, only: [:show, :edit, :update, :destroy]

  # GET /bank_account_types
  # GET /bank_account_types.json
  def index
    @bank_account_types = BankAccountType.all
  end

  # GET /bank_account_types/1
  # GET /bank_account_types/1.json
  def show
  end

  # GET /bank_account_types/new
  def new
    @bank_account_type = BankAccountType.new
  end

  # GET /bank_account_types/1/edit
  def edit
  end

  # POST /bank_account_types
  # POST /bank_account_types.json
  def create
    @bank_account_type = BankAccountType.new(bank_account_type_params)

    respond_to do |format|
      if @bank_account_type.save
        format.html { redirect_to @bank_account_type, notice: 'Bank account type was successfully created.' }
        format.json { render :show, status: :created, location: @bank_account_type }
      else
        format.html { render :new }
        format.json { render json: @bank_account_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_account_types/1
  # PATCH/PUT /bank_account_types/1.json
  def update
    respond_to do |format|
      if @bank_account_type.update(bank_account_type_params)
        format.html { redirect_to @bank_account_type, notice: 'Bank account type was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_account_type }
      else
        format.html { render :edit }
        format.json { render json: @bank_account_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_account_types/1
  # DELETE /bank_account_types/1.json
  def destroy
    @bank_account_type.destroy
    respond_to do |format|
      format.html { redirect_to bank_account_types_url, notice: 'Bank account type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account_type
      @bank_account_type = BankAccountType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_account_type_params
      params.require(:bank_account_type).permit(:name)
    end
end
