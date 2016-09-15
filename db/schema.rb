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

ActiveRecord::Schema.define(version: 20160915205135) do

  create_table "administrators", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "second_name"
    t.string   "first_last_name",                     null: false
    t.string   "second_last_name"
    t.string   "mobile"
    t.string   "landline"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "common_expense_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.float    "water"
    t.float    "gas"
    t.float    "electricity"
    t.float    "others"
    t.text     "details"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "period"
  end

  create_table "common_expense_subunits", force: :cascade do |t|
    t.integer  "subunit_id"
    t.float    "electricity_charge"
    t.float    "water_charge"
    t.float    "gas_charge"
    t.float    "others_charge"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "second_name"
    t.string   "first_last_name",                     null: false
    t.string   "second_last_name"
    t.string   "rut"
    t.string   "rut_verif"
    t.string   "mobile"
    t.string   "landline"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.float    "square_meters"
    t.integer  "property_type_id"
    t.integer  "renter_id"
    t.float    "rent_value"
    t.integer  "number"
    t.integer  "subunits_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "comune_id"
    t.integer  "lease_startdate"
    t.integer  "owner_id"
  end

  create_table "properties_subunits", id: false, force: :cascade do |t|
    t.integer "property_id"
    t.integer "subunit_id"
  end

  add_index "properties_subunits", ["property_id"], name: "index_properties_subunits_on_property_id"
  add_index "properties_subunits", ["subunit_id"], name: "index_properties_subunits_on_subunit_id"

  create_table "property_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "renters", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "second_name"
    t.string   "first_last_name",                     null: false
    t.string   "second_last_name"
    t.string   "mobile"
    t.string   "landline"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "renters", ["email"], name: "index_renters_on_email", unique: true
  add_index "renters", ["reset_password_token"], name: "index_renters_on_reset_password_token", unique: true

  create_table "subunits", force: :cascade do |t|
    t.float    "square_meters"
    t.integer  "property_type_id"
    t.integer  "renter_id"
    t.float    "rent_value"
    t.integer  "number"
    t.date     "lease_startdate"
    t.integer  "owner_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "property_id"
    t.float    "proration_percentage"
  end

end
