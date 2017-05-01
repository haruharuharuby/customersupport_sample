class CampaignsController < ApplicationController
  layout "not_login"
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.answer campaign_params
        format.html { redirect_to completed_orders_path, notice: 'Thank you for join this campaign!!!' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render "show" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
      logger.debug(@campaign)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      # params.require(:campaign).permit(:name, :term_begin, :term_end, :description, :confirming)
      permitted = params.require(:campaign).permit(:name,
        questionnaires_attributes: [:id, :name, :question_type, :campaign_id,
          selection_items_attributes: [:id, :name, :element, :selected]]
      )
    end
end
