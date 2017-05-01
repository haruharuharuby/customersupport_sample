class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :nursery_id
      t.integer :billing_type, null: false, default: 0 #0:nursery, 1:organization, 2:private
      t.timestamps null: false
    end
  end
end
