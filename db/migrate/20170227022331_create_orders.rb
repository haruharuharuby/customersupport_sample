class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :uuid
      t.string :org_nursery_name, default: ''
      t.string :org_nursery_kana, default: ''
      t.string :nursery_name, default: ''
      t.string :nursery_kana, default: ''
      t.string :nursery_postal, default: ''
      t.string :nursery_addr1, default: ''
      t.string :nursery_addr2, default: ''
      t.string :nursery_phone, default: ''
      t.string :nursery_fax, default: ''
      t.string :nursery_email, default: ''
      t.string :nursery_responder_name, default: ''
      t.string :nursery_responder_kana, default: ''
      t.boolean :is_first_order, default: true
      t.string :same_org_other_nursery_name, default: ''
      t.string :same_org_other_nursery_phone
      t.boolean :is_ship_to_nursery, default: true
      t.string :shipping_name, default: ''
      t.string :shipping_kana, default: ''
      t.string :shipping_postal, default: ''
      t.string :shipping_addr1, default: ''
      t.string :shipping_addr2, default: ''
      t.string :shipping_phone, default: ''
      t.string :shipping_responder_name, default: ''
      t.string :shipping_responder_kana, default: ''
      t.integer :billing_ship_to, default: 0
      t.string :billing_shipping_name, default: ''
      t.string :billing_shipping_kana, default: ''
      t.string :billing_shipping_postal, default: ''
      t.string :billing_shipping_addr1, default: ''
      t.string :billing_shipping_addr2, default: ''
      t.string :billing_shipping_phone, default: ''
      t.string :billing_responder_name, default: ''
      t.string :billing_responder_kana, default: ''
      t.integer :billing_name_option, default: 0
      t.integer :nursery_condition, default: 0
      t.string :nursery_will_change_at
      t.integer :shipping_option, default: 0
      t.string :contact_name, default: ''
      t.string :contact_kana, default: ''
      t.string :contact_phone, default: ''
      t.string :contact_email, default: ''
      t.text :request
      t.integer :sum, default: 0
      t.integer :sum_tax_in, default: 0

      t.timestamps null: false
    end
  end
end
