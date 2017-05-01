class CreateCsps < ActiveRecord::Migration
  def change
    create_table :csps do |t|
      t.string :number
      t.datetime :period_begin
      t.datetime :period_end
      t.string :password
      t.integer :grade, null:false, default:0
      t.timestamps null: false
    end
  end
end
