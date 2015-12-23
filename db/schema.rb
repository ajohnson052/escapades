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

ActiveRecord::Schema.define(version: 20151223121255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date     "start_date",  null: false
    t.date     "end_date",    null: false
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "availabilities", ["response_id"], name: "index_availabilities_on_response_id", using: :btree

  create_table "commits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "escapade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "commits", ["escapade_id"], name: "index_commits_on_escapade_id", using: :btree
  add_index "commits", ["user_id"], name: "index_commits_on_user_id", using: :btree

  create_table "escapades", force: :cascade do |t|
    t.string   "title",                                                                                                                                  null: false
    t.date     "start_date",                                                                                                                             null: false
    t.date     "end_date",                                                                                                                               null: false
    t.string   "location"
    t.string   "activity"
    t.string   "description"
    t.string   "image",       default: "http://www.outdoorfitnessisrael.co.il/wp-content/themes/envision-v1/lib/images/default-placeholder-960x540.png"
    t.string   "status",      default: "idea"
    t.integer  "user_id"
    t.datetime "created_at",                                                                                                                             null: false
    t.datetime "updated_at",                                                                                                                             null: false
  end

  add_index "escapades", ["user_id"], name: "index_escapades_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "escapade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "responses", ["escapade_id"], name: "index_responses_on_escapade_id", using: :btree
  add_index "responses", ["user_id", "escapade_id"], name: "index_responses_on_user_id_and_escapade_id", unique: true, using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "tempships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "temp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "availabilities", "responses"
  add_foreign_key "commits", "escapades"
  add_foreign_key "commits", "users"
  add_foreign_key "escapades", "users"
  add_foreign_key "responses", "escapades"
  add_foreign_key "responses", "users"
end
