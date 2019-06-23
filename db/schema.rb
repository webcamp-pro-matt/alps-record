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

ActiveRecord::Schema.define(version: 2019_06_23_074731) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "good_id"
    t.integer "cart_value"
    t.integer "user_id"
  end

  create_table "delivery_prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delivery_price"
    t.datetime "delivery_start_day"
    t.datetime "delivery_finish_day"
  end

  create_table "goods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist"
    t.string "goods_title"
    t.integer "album_flag"
    t.string "jacket_image_id"
    t.string "type"
    t.string "rabel"
    t.integer "price"
    t.integer "stock"
    t.string "goods_status"
  end

  create_table "music_titles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "good_id"
    t.string "song"
    t.integer "song_number"
    t.integer "disc_number"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.string "other_address"
    t.integer "payment_method"
    t.string "delivery"
    t.string "other_name"
    t.string "other_kana"
    t.string "other_post_code"
    t.integer "delivery_select_flag"
    t.integer "buy_flag"
  end

  create_table "orders_children", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "goods_id"
    t.integer "order_value"
    t.integer "order_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "tax"
    t.datetime "tax_start_day"
    t.datetime "tax_finish_day"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone_number", null: false
    t.integer "admin_flag", default: 0, null: false
    t.integer "resignation_flag", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_children", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_kanji_sei"
    t.string "name_kanji_mei"
    t.string "name_kana_sei"
    t.string "name_kana_mei"
    t.string "post_code"
    t.string "address"
    t.integer "user_id"
  end

end
