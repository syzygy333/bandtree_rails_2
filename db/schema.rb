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

ActiveRecord::Schema.define(version: 20151014140006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string  "first_name",                            null: false
    t.string  "middle_name"
    t.string  "last_name",                             null: false
    t.string  "stage_name"
    t.boolean "stage_name_preferred?", default: false
    t.text    "biography"
    t.string  "official_link"
    t.string  "wiki_link"
    t.string  "portrait"
    t.boolean "private?",              default: false
  end

  create_table "artists_bands", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "band_id"
  end

  add_index "artists_bands", ["artist_id"], name: "index_artists_bands_on_artist_id", using: :btree
  add_index "artists_bands", ["band_id"], name: "index_artists_bands_on_band_id", using: :btree

  create_table "artists_releases", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "release_id"
  end

  add_index "artists_releases", ["artist_id"], name: "index_artists_releases_on_artist_id", using: :btree
  add_index "artists_releases", ["release_id"], name: "index_artists_releases_on_release_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string  "name",                          null: false
    t.text    "biography"
    t.string  "official_link"
    t.string  "wiki_link"
    t.boolean "private?",      default: false
    t.string  "band_photo"
  end

  create_table "bands_releases", id: false, force: :cascade do |t|
    t.integer "band_id"
    t.integer "release_id"
  end

  add_index "bands_releases", ["band_id"], name: "index_bands_releases_on_band_id", using: :btree
  add_index "bands_releases", ["release_id"], name: "index_bands_releases_on_release_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "releases", force: :cascade do |t|
    t.string  "title",                            null: false
    t.text    "track_list",                       null: false
    t.integer "year_released"
    t.string  "record_label",                     null: false
    t.string  "record_label_url"
    t.string  "catalog_number"
    t.string  "wiki_link"
    t.string  "release_type"
    t.string  "release_length"
    t.boolean "private?",         default: false
    t.string  "release_art"
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

end
