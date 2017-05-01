class CreateEstimationProductRelations < ActiveRecord::Migration
  def change
    create_table :estimation_product_relations do |t|
      t.integer :estimation_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
