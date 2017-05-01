class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.date :term_begin
      t.date :term_end
      t.string :description
      t.integer :product_id
      t.integer :discount
      
      t.timestamps null: false
    end
  end
end
