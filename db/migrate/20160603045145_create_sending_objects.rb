class CreateSendingObjects < ActiveRecord::Migration
  def change
    create_table :sending_objects do |t|
      t.string :name
      t.integer :nursery_id
      t.date :sended_at
      t.string :description
      t.string :links
      t.timestamps null: false
    end
  end
end
