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

ActiveRecord::Schema.define(version: 20160414090223) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "user_id"
    t.string   "reservation_id"
    t.string   "listing_name"
    t.string   "property_type"
    t.string   "room_type"
    t.text     "description"
    t.integer  "accommodates"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.integer  "price"
    t.string   "currency"
    t.date     "availability"
    t.integer  "bedrooms"
    t.integer  "beds"
    t.integer  "bathrooms"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.json     "photos"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "user_id"
    t.string   "braintree_transaction_id"
    t.string   "last_4"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "payments", ["reservation_id", "user_id"], name: "index_payments_on_reservation_id_and_user_id", unique: true, using: :btree

  create_table "reservations", force: :cascade do |t|
    t.string   "user_id"
    t.string   "listing_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "first_name"
<<<<<<< HEAD
    t.string   "avatar"
=======
>>>>>>> master
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
