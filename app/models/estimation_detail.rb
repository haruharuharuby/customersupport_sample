class EstimationDetail < ActiveRecord::Base
  belongs_to :estimation
  belongs_to :product

end
