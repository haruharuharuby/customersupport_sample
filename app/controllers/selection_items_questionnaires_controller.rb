class SelectionItemsQuestionnairesController < ApplicationController
  before_action :set_selection_items_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /selection_items_questionnaires
  # GET /selection_items_questionnaires.json
  def index
    @selection_items_questionnaires = SelectionItemsQuestionnaire.all
  end

  # GET /selection_items_questionnaires/1
  # GET /selection_items_questionnaires/1.json
  def show
  end

  # GET /selection_items_questionnaires/new
  def new
    @selection_items_questionnaire = SelectionItemsQuestionnaire.new
  end

  # GET /selection_items_questionnaires/1/edit
  def edit
  end

  # POST /selection_items_questionnaires
  # POST /selection_items_questionnaires.json
  def create
    @selection_items_questionnaire = SelectionItemsQuestionnaire.new(selection_items_questionnaire_params)

    respond_to do |format|
      if @selection_items_questionnaire.save
        format.html { redirect_to @selection_items_questionnaire, notice: 'Selection items questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @selection_items_questionnaire }
      else
        format.html { render :new }
        format.json { render json: @selection_items_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_items_questionnaires/1
  # PATCH/PUT /selection_items_questionnaires/1.json
  def update
    respond_to do |format|
      if @selection_items_questionnaire.update(selection_items_questionnaire_params)
        format.html { redirect_to @selection_items_questionnaire, notice: 'Selection items questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @selection_items_questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @selection_items_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_items_questionnaires/1
  # DELETE /selection_items_questionnaires/1.json
  def destroy
    @selection_items_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to selection_items_questionnaires_url, notice: 'Selection items questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection_items_questionnaire
      @selection_items_questionnaire = SelectionItemsQuestionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_items_questionnaire_params
      params.require(:selection_items_questionnaire).permit(:name, :questionnaire_id)
    end
end
