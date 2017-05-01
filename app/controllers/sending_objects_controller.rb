class SendingObjectsController < ApplicationController
  before_action :set_sending_object, only: [:show, :edit, :update, :destroy]

  # GET /sending_objects
  # GET /sending_objects.json
  def index
    @sending_objects = current_csp.nursery.sending_objects.all
  end

  # GET /sending_objects/1
  # GET /sending_objects/1.json
  def show
  end

  # GET /sending_objects/new
  def new
    @sending_object = SendingObject.new
  end

  # GET /sending_objects/1/edit
  def edit
  end

  # POST /sending_objects
  # POST /sending_objects.json
  def create
    @sending_object = SendingObject.new(sending_object_params)

    respond_to do |format|
      if @sending_object.save
        format.html { redirect_to @sending_object, notice: 'Sending object was successfully created.' }
        format.json { render :show, status: :created, location: @sending_object }
      else
        format.html { render :new }
        format.json { render json: @sending_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sending_objects/1
  # PATCH/PUT /sending_objects/1.json
  def update
    respond_to do |format|
      if @sending_object.update(sending_object_params)
        format.html { redirect_to @sending_object, notice: 'Sending object was successfully updated.' }
        format.json { render :show, status: :ok, location: @sending_object }
      else
        format.html { render :edit }
        format.json { render json: @sending_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sending_objects/1
  # DELETE /sending_objects/1.json
  def destroy
    @sending_object.destroy
    respond_to do |format|
      format.html { redirect_to sending_objects_url, notice: 'Sending object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sending_object
      @sending_object = SendingObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sending_object_params
      params.require(:sending_object).permit(:name, :nursery_id, :sended_at, :description)
    end
end
