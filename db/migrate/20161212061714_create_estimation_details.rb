class CreateEstimationDetails < ActiveRecord::Migration
  def change
    create_table :estimation_details do |t|
      t.integer :estimation_id
      t.integer :product_id
      t.integer :price, null: false, default: 0
      t.integer :quantity, null: false, default: 0
      t.integer :charge, null: false, default: 0

      t.timestamps null: false
    end
  end
end
