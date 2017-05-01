class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :num
      t.integer :charge
      t.integer :charge_tax_in
      t.integer :tax

      t.timestamps null: false
    end
  end
end
