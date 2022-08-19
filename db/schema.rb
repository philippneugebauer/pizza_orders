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

ActiveRecord::Schema[7.0].define(version: 2022_08_18_114320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.string "code"
    t.decimal "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_item_ingredients", force: :cascade do |t|
    t.bigint "order_item_id", null: false
    t.bigint "ingredient_id", null: false
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_order_item_ingredients_on_ingredient_id"
    t.index ["order_item_id"], name: "index_order_item_ingredients_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "extras", array: true
    t.string "omited", array: true
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pizza_id"
    t.bigint "pizza_size_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["pizza_id"], name: "index_order_items_on_pizza_id"
    t.index ["pizza_size_id"], name: "index_order_items_on_pizza_size_id"
  end

  create_table "order_promotions", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "promotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_promotions_on_order_id"
    t.index ["promotion_id"], name: "index_order_promotions_on_promotion_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price"
    t.text "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discount_id"
    t.index ["discount_id"], name: "index_orders_on_discount_id"
  end

  create_table "pizza_sizes", force: :cascade do |t|
    t.string "name"
    t.decimal "multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string "code"
    t.integer "from"
    t.integer "to"
    t.bigint "pizza_size_id", null: false
    t.bigint "pizza_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pizza_id"], name: "index_promotions_on_pizza_id"
    t.index ["pizza_size_id"], name: "index_promotions_on_pizza_size_id"
  end

  add_foreign_key "order_item_ingredients", "ingredients"
  add_foreign_key "order_item_ingredients", "order_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "pizza_sizes"
  add_foreign_key "order_items", "pizzas"
  add_foreign_key "order_promotions", "orders"
  add_foreign_key "order_promotions", "promotions"
  add_foreign_key "orders", "discounts"
  add_foreign_key "promotions", "pizza_sizes"
  add_foreign_key "promotions", "pizzas"
end
