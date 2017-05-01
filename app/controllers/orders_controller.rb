class OrdersController < ApplicationController
  layout "not_login"
  before_action :set_order, only: [:show, :edit, :update, :destroy, :complete]

  # GET /orders
  # GET /orders.json
  def index
    redirect_to :back
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    expires_now

    @order = Order.new
    @order.build_detail
    @order.sum = Order.calc_sum
    @order.sum_tax_in = Order.calc_sum_tax_in
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.ship_to

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_order_questionnaire_url(order_id: @order), notice: t('order.accepted') }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def top
    @wanpaku_price = Order.wanpaku_discount_price
    @wanpaku_price_tax_in = Order.wanpaku_discount_price_tax_in
    @csp_price = Order.csp_discount_price
    @csp_price_tax_in = Order.csp_discount_price_tax_in
    @top_sum = Order.calc_sum
    @top_sum_tax_in = Order.calc_sum_tax_in
  end

  def complete
    @order.put_order()
    @order.inform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:confirming, :org_nursery_name, :org_nursery_kana, :nursery_name, :nursery_kana, :nursery_postal, :nursery_addr1, :nursery_addr2, :nursery_phone, :nursery_fax, :nursery_email, :nursery_responder_name, :nursery_responder_kana, :is_first_order, :same_org_other_nursery_name, :same_org_other_nursery_phone, :is_ship_to_nursery, :shipping_name, :shipping_kana, :shipping_postal, :shipping_addr1, :shipping_addr2, :shipping_phone, :shipping_responder_name, :shipping_responder_kana, :billing_ship_to, :billing_shipping_name, :billing_shipping_kana, :billing_shipping_postal, :billing_shipping_addr1, :billing_shipping_addr2, :billing_shipping_phone, :billing_responder_name, :billing_responder_kana, :billing_name_option, :nursery_condition, :nursery_will_change_at, :shipping_option, :contact_name, :contact_kana, :contact_phone, :contact_email, :request, :sum, :sum_tax_in, order_details_attributes: [:id, :product_id, :order_id, :num, :charge, :charge_tax_in])

    end
end
