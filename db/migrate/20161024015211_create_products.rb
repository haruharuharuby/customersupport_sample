class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price, null: false, default: 0
      t.datetime :support_begin
      t.datetime :support_end
      t.string :version

      t.timestamps null: false
    end
  end
end
