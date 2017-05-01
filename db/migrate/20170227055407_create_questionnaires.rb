class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :order_id
      t.string :name

      t.string :item1
      t.boolean :item1_check1, default: false
      t.boolean :item1_check2, default: false
      t.boolean :item1_check3, default: false
      t.boolean :item1_check4, default: false
      t.boolean :item1_check5, default: false
      t.boolean :item1_check6, default: false
      t.boolean :item1_check7, default: false
      t.string :item1_text

      t.string :item2
      t.integer :item2_radio, default: 0
      t.string :item2_text

      t.string :item3
      t.integer :item3_radio, default: 0
      t.string :item3_text

      t.string :item4
      t.boolean :item4_check1, default: false
      t.boolean :item4_check2, default: false
      t.boolean :item4_check3, default: false
      t.boolean :item4_check4, default: false
      t.boolean :item4_check5, default: false
      t.boolean :item4_check6, default: false
      t.boolean :item4_check7, default: false
      t.boolean :item4_check8, default: false
      t.boolean :item4_check9, default: false
      t.boolean :item4_check10, default: false
      t.string :item4_text

      t.string :item5
      t.boolean :item5_check1, default: false
      t.boolean :item5_check2, default: false
      t.boolean :item5_check3, default: false
      t.boolean :item5_check4, default: false
      t.boolean :item5_check5, default: false
      t.boolean :item5_check6, default: false
      t.boolean :item5_check7, default: false
      t.boolean :item5_check8, default: false
      t.boolean :item5_check9, default: false
      t.boolean :item5_check10, default: false

      t.string :item6
      t.integer :item6_radio, default: 0

      t.string :item7
      t.string :item7_text

      t.timestamps null: false
    end
  end
end
