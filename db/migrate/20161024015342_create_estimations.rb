class CreateEstimations < ActiveRecord::Migration
  def change
    create_table :estimations do |t|
      t.string :uuid
      t.integer :nursery_id
      t.integer :coupon_attached, null: false, default: 0
      t.integer :tax, null: false, default: 0
      t.integer :total, null: false, default: 0

      t.timestamps null: false
    end
  end
end
