# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_23_080404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "cik", null: false
    t.string "name"
    t.string "ticker"
    t.text "prices"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "sector"
    t.text "industry"
    t.integer "employees", default: 0
    t.bigint "market_cap", default: 0
    t.float "percent_insiders", default: 0.0
  end

  create_table "dummies", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["email"], name: "index_dummies_on_email", unique: true
  end

  create_table "form4s", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "insider_id"
    t.float "sum_shares", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "officer_title"
    t.float "sum_shares_after", default: 0.0
  end

  create_table "insiders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.integer "gender", default: 0
    t.integer "age", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "stripe_customer_id"
  end

end
