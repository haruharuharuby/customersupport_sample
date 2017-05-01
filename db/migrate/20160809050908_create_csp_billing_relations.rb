class CreateCspBillingRelations < ActiveRecord::Migration
  def change
    create_table :csp_billing_relations do |t|
      t.integer :csp_id
      t.integer :billing_id
      t.boolean :enabled, null: false, default: true

      t.timestamps null: false
    end
  end
end
