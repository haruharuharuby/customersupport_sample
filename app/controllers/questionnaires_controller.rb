class QuestionnairesController < ApplicationController
  layout "not_login"
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @order = Order.find(params[:order_id])
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @order = Order.find(params[:order_id])
    @questionnaire = Questionnaire.new(questionnaire_params)
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to complete_order_path(params[:order_id]), notice: t("questionnaire.completed") }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:order_id, :name, :item1, :item1_check1, :item1_check2, :item1_check3, :item1_check4, :item1_check5, :item1_check6, :item1_check7, :item1_text, :item2, :item2_radio, :item2_text, :item3, :item3_radio, :item3_text, :item4, :item4_check1, :item4_check2, :item4_check3, :item4_check4, :item4_check5, :item4_check6, :item4_check7, :item4_check8, :item4_check9, :item4_check10, :item4_text, :item5, :item5_check1, :item5_check2, :item5_check3, :item5_check4, :item5_check5, :item5_check6, :item5_check7, :item5_check8, :item5_check9, :item5_check10, :item6, :item6_radio, :item7_text)
    end
end
