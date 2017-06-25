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

ActiveRecord::Schema.define(version: 20170625092045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token_digest"
    t.bigint "user_id"
    t.bigint "api_key_id"
    t.datetime "accessed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key_id"], name: "index_access_tokens_on_api_key_id"
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "key"
    t.boolean "active", default: true
    t.string "access_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_key"], name: "index_api_keys_on_access_key"
    t.index ["key"], name: "index_api_keys_on_key"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_event_types_on_parent_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.integer "coming_users_count", default: 0, null: false
    t.integer "event_type_id", null: false
    t.string "state", null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "location"
    t.integer "user_id", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "user_event_attends", force: :cascade do |t|
    t.string "state"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_event_attends_on_event_id"
    t.index ["user_id"], name: "index_user_event_attends_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "given_name"
    t.string "family_name"
    t.datetime "last_logged_in_at"
    t.string "confirmation_token"
    t.text "confirmation_redirect_url"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.text "reset_password_redirect_url"
    t.datetime "reset_password_sent_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "access_tokens", "api_keys"
  add_foreign_key "access_tokens", "users"
  add_foreign_key "user_event_attends", "events"
  add_foreign_key "user_event_attends", "users"
end
