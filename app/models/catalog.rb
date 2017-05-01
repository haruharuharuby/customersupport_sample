class Catalog < ActiveRecord::Base
  include Confirmable
  include InhouseDatabase
  include AssociationNurseryHelper

  belongs_to :nursery
  accepts_nested_attributes_for :nursery
  belongs_to :product

  def save
    if self.invalid?
      return false
    end

    build_for_create_or_update('nursery')

    result = super

    inform if result

    result
  end

  def inform
    AdmMailer.catalog_offered(self.nursery.email, self).deliver_now
    AdmMailer.catalog_offered_to_staff(self).deliver_now
  end
end
