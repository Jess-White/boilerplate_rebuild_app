# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_09_213717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bio_grants", force: :cascade do |t|
    t.integer "grant_id"
    t.integer "bio_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bios", force: :cascade do |t|
    t.integer "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.integer "wordcount"
    t.boolean "archived", default: false
  end

  create_table "boilerplates", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "category_id"
    t.string "title"
    t.text "text"
    t.integer "wordcount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "organization_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
  end

  create_table "funding_orgs", force: :cascade do |t|
    t.string "website"
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
  end

  create_table "grants", force: :cascade do |t|
    t.integer "organization_id"
    t.string "title"
    t.integer "funding_org_id"
    t.string "rfp_url"
    t.datetime "deadline"
    t.boolean "submitted"
    t.boolean "successful"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "purpose"
    t.boolean "archived", default: false
  end

  create_table "organization_users", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "report_sections", force: :cascade do |t|
    t.integer "report_id"
    t.string "title"
    t.text "text"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wordcount"
    t.boolean "archived", default: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "grant_id"
    t.string "title"
    t.datetime "deadline"
    t.boolean "submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "grant_id"
    t.string "title"
    t.text "text"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wordcount"
    t.boolean "archived", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "active"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
