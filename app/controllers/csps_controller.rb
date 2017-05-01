class CspsController < ApplicationController
  before_action :authenticate_csp!, except: [:search]
  before_action :set_csp, only: [:show, :edit, :update, :destroy]

  # GET /csps
  # GET /csps.json
  def index
    @csps = Csp.all
  end

  # GET /csps/1
  # GET /csps/1.json
  def show
  end

  # GET /csps/new
  def new
    @csp = Csp.new
  end

  # GET /csps/1/edit
  def edit
  end

  # POST /csps
  # POST /csps.json
  def create
    @csp = Csp.new(csp_params)

    respond_to do |format|
      if @csp.save
        format.html { redirect_to @csp, notice: 'Csp was successfully created.' }
        format.json { render :show, status: :created, location: @csp }
      else
        format.html { render :new }
        format.json { render json: @csp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csps/1
  # PATCH/PUT /csps/1.json
  def update
    respond_to do |format|
      if @csp.update(csp_params)
        format.html { redirect_to @csp, notice: t("notice.updated") }
        format.json { render :show, status: :ok, location: @csp }
      else
        format.html { render :edit }
        format.json { render json: @csp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csps/1
  # DELETE /csps/1.json
  def destroy
    @csp.destroy
    respond_to do |format|
      format.html { redirect_to csps_url, notice: 'Csp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csp
      @csp = current_csp if current_csp.id == params[:id].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csp_params
      params.require(:csp).permit(:number, :term_begin, :term_end, :dm_number, :grade, :password,
        nursery_attributes:[:id, :name, :address, :phone, :fax, :email, :responder, :billing_address, :status, :csp_id])
    end
end
