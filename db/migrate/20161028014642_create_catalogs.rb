class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :question
      t.string :answer_of_questionnaire
      t.integer :nursery_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
