class Billing < ActiveRecord::Base
  has_many :csp_billing_relations
  has_many :csps, through: :csp_billing_relations
  belongs_to :nursery
  accepts_nested_attributes_for :nursery
  
  enum billing_type: { nursery:0, organization:1, reseller:2 }

  def duplicates(excludes)
    self.csps.where.not(id: excludes)
  end

  def duplicate?
    self.csps.count > 1
  end
end
