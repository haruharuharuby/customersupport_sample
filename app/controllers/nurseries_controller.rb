class NurseriesController < ApplicationController
  before_action :set_nursery, only: [:show, :edit, :update, :destroy]

  # GET /nurseries
  # GET /nurseries.json
  def index
    @nurseries = Nursery.all
  end

  # GET /nurseries/1
  # GET /nurseries/1.json
  def show
  end

  # GET /nurseries/new
  def new
    @nursery = Nursery.new
  end

  # GET /nurseries/1/edit
  def edit
  end

  # POST /nurseries
  # POST /nurseries.json
  def create
    @nursery = Nursery.new(nursery_params)

    respond_to do |format|
      if @nursery.save
        format.html { redirect_to @nursery, notice: 'Nursery was successfully created.' }
        format.json { render :show, status: :created, location: @nursery }
      else
        format.html { render :new }
        format.json { render json: @nursery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nurseries/1
  # PATCH/PUT /nurseries/1.json
  def update
    respond_to do |format|
      if @nursery.update(nursery_params)
        format.html { redirect_to @nursery, notice: t("notice.updated") }
        format.json { render :show, status: :ok, location: @nursery }
      else
        format.html { render :edit }
        format.json { render json: @nursery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nurseries/1
  # DELETE /nurseries/1.json
  def destroy
    @nursery.destroy
    respond_to do |format|
      format.html { redirect_to nurseries_url, notice: 'Nursery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    dm_number = params[:dm_number]
    postal_code = params[:validate_postal_code]
    phone = params[:validate_phone]
    source = params[:source]

    result = Nursery.search dm_number, postal_code, phone

    respond_to do |format|
      if result
        format.json { render json: result, status: :ok }
      else
        format.json { render json: {error: t("errors.customer_not_found")}, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nursery
      @nursery = current_csp.nursery if current_csp.nursery.id == params[:id].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nursery_params
      params.require(:nursery).permit(:name, :kana, :postal_code, :address1, :address2, :phone, :fax, :email, :status, :responder, :dm_number, :organization_id, :csp_id)
    end
end
