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

ActiveRecord::Schema.define(version: 2023_02_19_235848) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "publisher"
    t.integer "price"
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "average_rating"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "book_id", null: false
    t.integer "quantity"
    t.decimal "total"
    t.decimal "unit_price"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["user_id"], name: "index_order_items_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review_id"
    t.integer "rating"
    t.string "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "references"
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["review_id"], name: "index_reviews_on_review_id", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_number"
    t.string "credit_card_number"
    t.string "address"
    t.string "phone_number"
    t.integer "quantity"
    t.decimal "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_transactions_on_book_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "cc_num"
    t.string "phone_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "transactions", "books"
  add_foreign_key "transactions", "users"
end
