class CspBillingRelation < ActiveRecord::Base
  belongs_to :csp
  belongs_to :billing
end
