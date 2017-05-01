# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161223021947) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "announcements", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "content",      limit: 255
    t.date     "period_begin"
    t.date     "period_end"
    t.boolean  "broadcast"
    t.integer  "nursery_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "billings", force: :cascade do |t|
    t.integer  "nursery_id",   limit: 4
    t.integer  "billing_type", limit: 4, default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.date     "term_begin"
    t.date     "term_end"
    t.string   "description", limit: 255
    t.integer  "product_id",  limit: 4
    t.integer  "discount",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "question",                limit: 255
    t.string   "answer_of_questionnaire", limit: 255
    t.integer  "nursery_id",              limit: 4
    t.integer  "product_id",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "nursery_id", limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "csp_billing_relations", force: :cascade do |t|
    t.integer  "csp_id",     limit: 4
    t.integer  "billing_id", limit: 4
    t.boolean  "enabled",              default: true, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "csps", force: :cascade do |t|
    t.string   "number",                 limit: 255
    t.datetime "period_begin"
    t.datetime "period_end"
    t.string   "password",               limit: 255
    t.integer  "grade",                  limit: 4,   default: 0,  null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "csps", ["number"], name: "index_csps_on_number", unique: true, using: :btree
  add_index "csps", ["reset_password_token"], name: "index_csps_on_reset_password_token", unique: true, using: :btree

  create_table "estimation_product_relations", force: :cascade do |t|
    t.integer  "estimation_id", limit: 4
    t.integer  "product_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estimations", force: :cascade do |t|
    t.string   "dm_number",         limit: 255
    t.string   "nursery_name",      limit: 255
    t.string   "postal_code",       limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "phone",             limit: 255
    t.string   "email",             limit: 255
    t.string   "responder",         limit: 255
    t.integer  "nursery_id",        limit: 4
    t.integer  "total_sum",         limit: 4
    t.string   "coupon_code",       limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "organization_name", limit: 255
    t.string   "fax",               limit: 255
  end

  create_table "nurseries", force: :cascade do |t|
    t.string   "dm_number",       limit: 255
    t.string   "name",            limit: 255
    t.string   "kana",            limit: 255
    t.string   "postal_code",     limit: 255
    t.string   "address1",        limit: 255
    t.string   "address2",        limit: 255
    t.string   "phone",           limit: 255
    t.string   "fax",             limit: 255
    t.string   "email",           limit: 255
    t.string   "responder",       limit: 255
    t.integer  "status",          limit: 4,   default: 0, null: false
    t.integer  "organization_id", limit: 4
    t.integer  "csp_id",          limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "nurseries", ["postal_code", "phone"], name: "index_nurseries_on_postal_code_and_phone", unique: true, using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "product_id",    limit: 4
    t.integer  "order_id",      limit: 4
    t.integer  "num",           limit: 4
    t.integer  "charge",        limit: 4
    t.integer  "charge_tax_in", limit: 4
    t.integer  "tax",           limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "uuid",                         limit: 255
    t.string   "org_nursery_name",             limit: 255,   default: ""
    t.string   "org_nursery_kana",             limit: 255,   default: ""
    t.string   "nursery_name",                 limit: 255,   default: ""
    t.string   "nursery_kana",                 limit: 255,   default: ""
    t.string   "nursery_postal",               limit: 255,   default: ""
    t.string   "nursery_addr1",                limit: 255,   default: ""
    t.string   "nursery_addr2",                limit: 255,   default: ""
    t.string   "nursery_phone",                limit: 255,   default: ""
    t.string   "nursery_fax",                  limit: 255,   default: ""
    t.string   "nursery_email",                limit: 255,   default: ""
    t.string   "nursery_responder_name",       limit: 255,   default: ""
    t.string   "nursery_responder_kana",       limit: 255,   default: ""
    t.boolean  "is_first_order",                             default: true
    t.string   "same_org_other_nursery_name",  limit: 255,   default: ""
    t.string   "same_org_other_nursery_phone", limit: 255
    t.boolean  "is_ship_to_nursery",                         default: true
    t.string   "shipping_name",                limit: 255,   default: ""
    t.string   "shipping_kana",                limit: 255,   default: ""
    t.string   "shipping_postal",              limit: 255,   default: ""
    t.string   "shipping_addr1",               limit: 255,   default: ""
    t.string   "shipping_addr2",               limit: 255,   default: ""
    t.string   "shipping_phone",               limit: 255,   default: ""
    t.string   "shipping_responder_name",      limit: 255,   default: ""
    t.string   "shipping_responder_kana",      limit: 255,   default: ""
    t.integer  "billing_ship_to",              limit: 4,     default: 0
    t.string   "billing_shipping_name",        limit: 255,   default: ""
    t.string   "billing_shipping_kana",        limit: 255,   default: ""
    t.string   "billing_shipping_postal",      limit: 255,   default: ""
    t.string   "billing_shipping_addr1",       limit: 255,   default: ""
    t.string   "billing_shipping_addr2",       limit: 255,   default: ""
    t.string   "billing_shipping_phone",       limit: 255,   default: ""
    t.string   "billing_responder_name",       limit: 255,   default: ""
    t.string   "billing_responder_kana",       limit: 255,   default: ""
    t.integer  "billing_name_option",          limit: 4,     default: 0
    t.integer  "nursery_condition",            limit: 4,     default: 0
    t.string   "nursery_will_change_at",       limit: 255
    t.integer  "shipping_option",              limit: 4,     default: 0
    t.string   "contact_name",                 limit: 255,   default: ""
    t.string   "contact_kana",                 limit: 255,   default: ""
    t.string   "contact_phone",                limit: 255,   default: ""
    t.string   "contact_email",                limit: 255,   default: ""
    t.text     "request",                      limit: 65535
    t.integer  "sum",                          limit: 4,     default: 0
    t.integer  "sum_tax_in",                   limit: 4,     default: 0
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.string   "kana",       limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "price",         limit: 4,   default: 0, null: false
    t.datetime "support_begin"
    t.datetime "support_end"
    t.string   "version",       limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "order_id",      limit: 4
    t.string   "name",          limit: 255
    t.string   "item1",         limit: 255
    t.boolean  "item1_check1",              default: false
    t.boolean  "item1_check2",              default: false
    t.boolean  "item1_check3",              default: false
    t.boolean  "item1_check4",              default: false
    t.boolean  "item1_check5",              default: false
    t.boolean  "item1_check6",              default: false
    t.boolean  "item1_check7",              default: false
    t.string   "item1_text",    limit: 255
    t.string   "item2",         limit: 255
    t.integer  "item2_radio",   limit: 4,   default: 0
    t.string   "item2_text",    limit: 255
    t.string   "item3",         limit: 255
    t.integer  "item3_radio",   limit: 4,   default: 0
    t.string   "item3_text",    limit: 255
    t.string   "item4",         limit: 255
    t.boolean  "item4_check1",              default: false
    t.boolean  "item4_check2",              default: false
    t.boolean  "item4_check3",              default: false
    t.boolean  "item4_check4",              default: false
    t.boolean  "item4_check5",              default: false
    t.boolean  "item4_check6",              default: false
    t.boolean  "item4_check7",              default: false
    t.boolean  "item4_check8",              default: false
    t.boolean  "item4_check9",              default: false
    t.boolean  "item4_check10",             default: false
    t.string   "item4_text",    limit: 255
    t.string   "item5",         limit: 255
    t.boolean  "item5_check1",              default: false
    t.boolean  "item5_check2",              default: false
    t.boolean  "item5_check3",              default: false
    t.boolean  "item5_check4",              default: false
    t.boolean  "item5_check5",              default: false
    t.boolean  "item5_check6",              default: false
    t.boolean  "item5_check7",              default: false
    t.boolean  "item5_check8",              default: false
    t.boolean  "item5_check9",              default: false
    t.boolean  "item5_check10",             default: false
    t.string   "item6",         limit: 255
    t.integer  "item6_radio",   limit: 4,   default: 0
    t.string   "item7",         limit: 255
    t.string   "item7_text",    limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "sending_objects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "nursery_id",  limit: 4
    t.date     "sended_at"
    t.string   "description", limit: 255
    t.string   "links",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end
end
