class ComunesController < ApplicationController
  before_action :set_comune, only: [:show, :edit, :update, :destroy]

  # GET /comunes
  # GET /comunes.json
  def index
    @comunes = Comune.all
  end

  # GET /comunes/1
  # GET /comunes/1.json
  def show
  end

  # GET /comunes/new
  def new
    @comune = Comune.new
  end

  # GET /comunes/1/edit
  def edit
  end

  # POST /comunes
  # POST /comunes.json
  def create
    @comune = Comune.new(comune_params)

    respond_to do |format|
      if @comune.save
        format.html { redirect_to @comune, notice: 'Comune was successfully created.' }
        format.json { render :show, status: :created, location: @comune }
      else
        format.html { render :new }
        format.json { render json: @comune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comunes/1
  # PATCH/PUT /comunes/1.json
  def update
    respond_to do |format|
      if @comune.update(comune_params)
        format.html { redirect_to @comune, notice: 'Comune was successfully updated.' }
        format.json { render :show, status: :ok, location: @comune }
      else
        format.html { render :edit }
        format.json { render json: @comune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comunes/1
  # DELETE /comunes/1.json
  def destroy
    @comune.destroy
    respond_to do |format|
      format.html { redirect_to comunes_url, notice: 'Comune was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comune
      @comune = Comune.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comune_params
      params.require(:comune).permit(:name)
    end
end
