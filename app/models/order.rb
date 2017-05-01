class Order < ActiveRecord::Base
  include InhouseDatabase
  include Confirmable
  include UuidHelper
  include Tax

  has_many :order_details
  accepts_nested_attributes_for :order_details

  has_one :questionnaire

  # presence validation
  validates :org_nursery_name, :org_nursery_kana, :nursery_name, :nursery_kana, presence: true
  validates :same_org_other_nursery_name, :same_org_other_nursery_phone, presence: true, if: "self.is_first_order == false"
  validates :nursery_postal, :nursery_addr1, :nursery_addr2, :nursery_phone, presence: true, if: :validate_nursery_presence?
  validates :shipping_name, :shipping_kana, :shipping_postal, :shipping_addr1, :shipping_addr2, :shipping_phone, presence: true, if: :validate_shipping_presence?
  validates :billing_shipping_name, :billing_shipping_kana, :billing_shipping_postal, :billing_shipping_addr1, :billing_shipping_addr2, :billing_shipping_phone, presence: true, if: :validate_billing_shpping_presence?
  validates :nursery_will_change_at, presence: true, if: "self.nursery_condition == 1 || self.nursery_condition == 2"
  validates :contact_name, :contact_kana, :contact_phone, :contact_email, presence: true

  # format validation
  validates :nursery_postal, format:{ with: /\A\d{3}-\d{4}\z/, message: I18n.t("errors.postal_code_format")}, if: "self.nursery_postal.present?"
  validates :nursery_email, format: {with: Devise::email_regexp }, if: "self.nursery_email.present?"
  validates :nursery_phone, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")}, if: "self.nursery_phone.present?"
  validates :nursery_fax, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")}, if: "self.nursery_fax.present?"
  validates :same_org_other_nursery_phone, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")}, if: "self.same_org_other_nursery_phone.present?"
  validates :shipping_postal, format:{ with: /\A\d{3}-\d{4}\z/, message: I18n.t("errors.postal_code_format")}, if: "self.shipping_postal.present?"
  validates :shipping_phone, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")}, if: "self.shipping_phone.present?"
  validates :billing_shipping_postal, format:{ with: /\A\d{3}-\d{4}\z/, message: I18n.t("errors.postal_code_format")}, if: "self.billing_shipping_postal.present?"
  validates :billing_shipping_phone, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")}, if: "self.billing_shipping_phone.present?"
  validates :contact_phone, format: { with: /\A0[0-9]{9,10}\z/, message: I18n.t("errors.phone_format")},  if: "self.contact_phone.present?"
  validates :contact_email, format: {with: Devise::email_regexp }, if: "self.contact_email.present?"
  validates :nursery_will_change_at, format: { with: /\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/, message: I18n.t("errors.date_format")}, if: "self.nursery_condition == 1 || self.nursery_condition == 2"
  DISCOUNT_WANPAKU_PRICE = 198000
  DISCOUNT_CSP_PRICE = 36900

  def self.wanpaku_discount_price()
    DISCOUNT_WANPAKU_PRICE
  end

  def self.wanpaku_discount_price_tax_in()
    self.tax_in(DISCOUNT_WANPAKU_PRICE)
  end

  def self.csp_discount_price()
    DISCOUNT_CSP_PRICE
  end

  def self.csp_discount_price_tax_in()
    self.tax_in(DISCOUNT_CSP_PRICE)
  end

  def self.calc_sum()
    DISCOUNT_WANPAKU_PRICE + DISCOUNT_CSP_PRICE
  end

  def self.calc_sum_tax_in()
    wanpaku_discount_price_tax_in + csp_discount_price_tax_in
  end

  def nursery_condition_prepare?()
    self.nursery_condition != 1
  end

  def build_detail()
    self.order_details.build(product_id:1, num:1, charge: Order.wanpaku_discount_price, charge_tax_in: Order.wanpaku_discount_price_tax_in)
    self.order_details.build(product_id:2, num:1, charge: Order.csp_discount_price, charge_tax_in: Order.csp_discount_price_tax_in)
  end

  def validate_nursery_presence?
    if self.is_ship_to_nursery == true
      return true
    else
      return self.billing_ship_to == 0 || shipping_option == 2
    end
  end

  def validate_shipping_presence?
    return self.is_ship_to_nursery == false
  end

  def validate_billing_shpping_presence?
    return self.billing_ship_to == 2
  end

  def ship_to
    if self.nursery_condition == 0
      self.shipping_option = 2
    end
  end

  def inform
    AdmMailer.order_complete(self.contact_email, self).deliver_now
  end
end
