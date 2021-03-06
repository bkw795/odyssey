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

ActiveRecord::Schema.define(version: 20151108221554) do

  create_table "atlas_pages", force: :cascade do |t|
    t.integer  "atlas_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "color_code"
  end

  create_table "atlases", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_atlas_page_relationships", force: :cascade do |t|
    t.integer "location_id"
    t.integer "atlas_page_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.float  "latitude"
    t.float  "longitude"
    t.string "address"
  end

  create_table "private_notes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
    t.text    "text"
  end

  create_table "public_tips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
    t.text    "tip_text"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "display_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
