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

ActiveRecord::Schema.define(version: 20161201145457) do

  create_table "cart_code_promotions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "promotion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.decimal  "item_price",  precision: 8, scale: 2, default: 0.0
    t.decimal  "total_price", precision: 8, scale: 2, default: 0.0
  end

  create_table "carts", force: :cascade do |t|
    t.decimal  "sub_total",   precision: 8, scale: 2, default: 0.0
    t.decimal  "discount",    precision: 8, scale: 2, default: 0.0
    t.decimal  "total_price", precision: 8, scale: 2, default: 0.0
    t.boolean  "approved"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "customer_id"
  end

  create_table "code_promotions", force: :cascade do |t|
    t.integer  "value"
    t.string   "name"
    t.integer  "code_type"
    t.boolean  "main",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.integer  "card_number", limit: 8
    t.integer  "card_month"
    t.integer  "card_year"
    t.integer  "card_cvv"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "quantity_promotions", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
