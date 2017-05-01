class Nursery < ActiveRecord::Base
  belongs_to :organization
  accepts_nested_attributes_for :organization

  belongs_to :csp
  has_many :announcements
  has_many :sending_objects
  has_many :contacts
  has_many :billings

  has_many :estimations
  accepts_nested_attributes_for :estimations
  has_many :catalogs
  has_many :orders
  has_many :order_applicants, class_name: "Order", foreign_key: "applicant_nursery_id"
  has_many :order_locations, class_name: "Order", foreign_key: "location_nursery_id"
  has_many :order_shippings, class_name: "Order", foreign_key: "shipping_nursery_id"

  has_many :nursery_group_relations
  has_many :groups, through: :nursery_group_relations
  accepts_nested_attributes_for :groups

  enum status: { before_opening:0, openning:1, closed:2 }

  validates :name, :postal_code, :address1, :address2, :phone, :email, :responder, presence:true
  validates :postal_code, format:{ with: /\A\d{3}-\d{4}\z/, message: I18n.t("errors.postal_code_format")}
  validates :phone, format:{ with: /\A\d{10}\z/, message: I18n.t("errors.phone_format")}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def self.search(dm_number, postal_code, phone)
    nursery = self.where(dm_number: dm_number)[0]
    if nursery && nursery.postal_code == postal_code && nursery.phone == phone
      ret = {}
      ret[:nursery] = nursery.as_json
      ret[:organization] = nursery.organization.as_json
      ret
    else
      nil
    end
  end

end
