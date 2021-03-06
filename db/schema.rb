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

ActiveRecord::Schema.define(version: 20170115004732) do

  create_table "contracts", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "rent"
    t.integer  "late_fee"
    t.integer  "deposit"
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.integer  "property_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "duration_of_lease"
    t.index ["landlord_id"], name: "index_contracts_on_landlord_id"
    t.index ["property_id"], name: "index_contracts_on_property_id"
    t.index ["tenant_id"], name: "index_contracts_on_tenant_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "total"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.integer  "contract_id"
    t.integer  "property_id"
    t.index ["contract_id"], name: "index_payments_on_contract_id"
    t.index ["landlord_id"], name: "index_payments_on_landlord_id"
    t.index ["property_id"], name: "index_payments_on_property_id"
    t.index ["tenant_id"], name: "index_payments_on_tenant_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "landlord_id"
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "requisitions", force: :cascade do |t|
    t.string   "issue"
    t.integer  "response_time"
    t.boolean  "resolved"
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.integer  "contract_id"
    t.integer  "property_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["contract_id"], name: "index_requisitions_on_contract_id"
    t.index ["landlord_id"], name: "index_requisitions_on_landlord_id"
    t.index ["property_id"], name: "index_requisitions_on_property_id"
    t.index ["tenant_id"], name: "index_requisitions_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terminations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
