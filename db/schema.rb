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

ActiveRecord::Schema.define(version: 2019_05_18_022943) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "gender"
    t.date "birthdate"
    t.string "email"
    t.string "latitude"
    t.string "longitude"
    t.string "address"
    t.string "user"
    t.string "password"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_clients_on_city_id"
  end

  create_table "cooks", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.boolean "state"
    t.string "gender"
    t.date "birthdate"
    t.integer "tel"
    t.string "email"
    t.string "latitude"
    t.string "longitude"
    t.string "address"
    t.string "user"
    t.string "password"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cooks_on_city_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "user"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
  end

  create_table "orders", force: :cascade do |t|
    t.string "orderable_type"
    t.integer "orderable_id"
    t.boolean "state"
    t.integer "quantity"
    t.integer "cost"
    t.date "order_date"
    t.integer "client_id"
    t.integer "product_id"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["driver_id"], name: "index_orders_on_driver_id"
    t.index ["orderable_type", "orderable_id"], name: "index_orders_on_orderable_type_and_orderable_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cook_id"
    t.index ["cook_id"], name: "index_products_on_cook_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewable_type"
    t.integer "reviewable_id"
    t.integer "qualification"
    t.text "content"
    t.integer "client_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
  end

end
