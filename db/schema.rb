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

ActiveRecord::Schema.define(version: 2019_03_13_130127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directions", force: :cascade do |t|
    t.string "name"
    t.bigint "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_directions_on_line_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "tbm_stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stop_id"
    t.index ["stop_id"], name: "index_favorites_on_stop_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "tbm_id"
    t.string "name"
    t.string "background"
    t.string "text_color"
    t.integer "kind"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "amelioration"
    t.string "like"
    t.string "body"
    t.integer "frenquencies"
    t.integer "recommendation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.string "tbm_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "direction_id"
    t.string "location"
    t.index ["direction_id"], name: "index_stops_on_direction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "directions", "lines"
  add_foreign_key "favorites", "stops"
  add_foreign_key "favorites", "users"
  add_foreign_key "stops", "directions"
end
