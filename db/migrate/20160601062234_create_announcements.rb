class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :content
      t.date :period_begin
      t.date :period_end
      t.boolean :broadcast
      t.integer :nursery_id
      t.timestamps null: false
    end
  end
end
