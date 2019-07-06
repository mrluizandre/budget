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

ActiveRecord::Schema.define(version: 2019_07_05_220047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "account_type"
    t.decimal "balance", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.decimal "budgeted", precision: 8, scale: 2, default: "0.0"
    t.decimal "activity", precision: 8, scale: 2, default: "0.0"
    t.decimal "balance", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "to_be_budgeted", default: false
    t.bigint "linked_credit_card_account_id"
    t.index ["linked_credit_card_account_id"], name: "index_categories_on_linked_credit_card_account_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", force: :cascade do |t|
    t.date "month"
    t.decimal "income", precision: 8, scale: 2, default: "0.0"
    t.decimal "budgeted", precision: 8, scale: 2, default: "0.0"
    t.decimal "activity", precision: 8, scale: 2, default: "0.0"
    t.decimal "to_be_budgeted", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scheduled_transactions", force: :cascade do |t|
    t.date "date"
    t.bigint "account_id"
    t.bigint "payee_id"
    t.bigint "category_id"
    t.decimal "inflow", precision: 8, scale: 2
    t.decimal "outflow", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false
    t.index ["account_id"], name: "index_scheduled_transactions_on_account_id"
    t.index ["category_id"], name: "index_scheduled_transactions_on_category_id"
    t.index ["payee_id"], name: "index_scheduled_transactions_on_payee_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "date"
    t.bigint "account_id"
    t.bigint "payee_id"
    t.bigint "category_id"
    t.bigint "transfer_account_id"
    t.bigint "transfer_transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "inflow", precision: 8, scale: 2
    t.decimal "outflow", precision: 8, scale: 2
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["payee_id"], name: "index_transactions_on_payee_id"
    t.index ["transfer_account_id"], name: "index_transactions_on_transfer_account_id"
    t.index ["transfer_transaction_id"], name: "index_transactions_on_transfer_transaction_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "account_from_id"
    t.bigint "account_to_id"
    t.decimal "amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_from_id"], name: "index_transfers_on_account_from_id"
    t.index ["account_to_id"], name: "index_transfers_on_account_to_id"
  end

  add_foreign_key "categories", "accounts", column: "linked_credit_card_account_id"
  add_foreign_key "scheduled_transactions", "accounts"
  add_foreign_key "scheduled_transactions", "categories"
  add_foreign_key "scheduled_transactions", "payees"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "accounts", column: "transfer_account_id"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "payees"
  add_foreign_key "transactions", "transactions", column: "transfer_transaction_id"
  add_foreign_key "transfers", "accounts", column: "account_from_id"
  add_foreign_key "transfers", "accounts", column: "account_to_id"
end
