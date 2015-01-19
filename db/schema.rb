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

ActiveRecord::Schema.define(version: 20130218033834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreement_fields", force: :cascade do |t|
    t.integer  "agreement_id"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled",      default: true, null: false
  end

  add_index "agreement_fields", ["agreement_id", "field_id"], name: "index_agreement_fields_on_agreement_id_and_field_id", using: :btree

  create_table "agreements", force: :cascade do |t|
    t.string   "user_name"
    t.string   "repo_name"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_repo_hook_id"
  end

  add_index "agreements", ["user_id"], name: "index_agreements_on_user_id", using: :btree
  add_index "agreements", ["user_name", "repo_name"], name: "index_agreements_on_user_name_and_repo_name", using: :btree

  create_table "announcements", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_entries", force: :cascade do |t|
    t.integer "signature_id"
    t.integer "agreement_field_id"
    t.text    "value"
  end

  add_index "field_entries", ["signature_id", "agreement_field_id"], name: "index_field_entries_on_signature_id_and_agreement_field_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "label"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled_by_default", default: true, null: false
    t.text     "description"
  end

  create_table "signatures", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "agreement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signatures", ["user_id", "agreement_id"], name: "index_signatures_on_user_id_and_agreement_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "uid"
    t.string   "oauth_token"
    t.string   "nickname"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
