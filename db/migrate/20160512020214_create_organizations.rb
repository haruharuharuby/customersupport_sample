class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null:false, default:"", limit:255
      t.string :kana, null:false, default:"", limit:255
      t.timestamps null: false
    end

    add_index :organizations, :name, unique:true
  end
end
