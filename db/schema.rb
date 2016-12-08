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

ActiveRecord::Schema.define(version: 20161122083640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billingdetails", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "productcategory_id"
    t.integer  "producttype_id"
    t.string   "productname"
    t.decimal  "productprice",       default: "0.0"
    t.integer  "productnb",          default: 0
    t.decimal  "total",              default: "0.0"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.date     "productdate"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "customer"
    t.string   "checkoutday"
    t.integer  "stays",       default: 0
    t.integer  "adults",      default: 0
    t.integer  "childs",      default: 0
    t.integer  "room_id"
    t.decimal  "roomfee",     default: "0.0"
    t.decimal  "sototal",     default: "0.0"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "productcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "productcategory_id"
    t.integer  "producttype_id"
    t.string   "name"
    t.decimal  "price",              default: "0.0"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "producttypes", force: :cascade do |t|
    t.integer  "productcategory_id"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price1",      default: "0.0"
    t.decimal  "price2",      default: "0.0"
    t.decimal  "price3",      default: "0.0"
    t.decimal  "price4",      default: "0.0"
    t.decimal  "price5",      default: "0.0"
    t.decimal  "price6",      default: "0.0"
    t.integer  "peoplenb",    default: 0
    t.integer  "roomtype_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "roomtypes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "phonetic"
    t.string   "pstalcode"
    t.string   "address"
    t.string   "tel"
    t.string   "fax"
    t.string   "invoicename1"
    t.string   "invoicename2"
  end

end
