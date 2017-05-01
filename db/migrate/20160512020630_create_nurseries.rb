class CreateNurseries < ActiveRecord::Migration
  def change
    create_table :nurseries do |t|
      t.string :dm_number
      t.string :name
      t.string :kana
      t.string :postal_code
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :fax
      t.string :email
      t.string :responder
      t.integer :status, null:false, default:0
      t.integer :organization_id
      t.integer :csp_id

      t.timestamps null: false
    end
    add_index :nurseries, [:postal_code, :phone], unique: true
  end
end
