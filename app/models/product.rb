class Product < ActiveRecord::Base
  has_many :estimation_product_relations
  has_many :estimations, through: :estimation_product_relations
end
