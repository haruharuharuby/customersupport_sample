class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :content
      t.integer :nursery_id, null: false

      t.timestamps null: false
    end
  end
end
