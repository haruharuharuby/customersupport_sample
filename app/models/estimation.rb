class Estimation < ActiveRecord::Base
  has_many :estimation_product_relations
  has_many :products, through: :estimation_product_relations
end
