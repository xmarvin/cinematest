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

ActiveRecord::Schema.define(version: 2019_08_02_192501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "video_id"
    t.integer "number", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_id", "number"], name: "index_episodes_on_video_id_and_number", unique: true
    t.index ["video_id"], name: "index_episodes_on_video_id"
  end

  create_table "purchase_options", force: :cascade do |t|
    t.string "video_quality", null: false
    t.decimal "price", null: false
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_id"], name: "index_purchase_options_on_video_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "expires_at", null: false
    t.bigint "user_id"
    t.bigint "purchase_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expires_at"], name: "index_purchases_on_expires_at"
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "type", null: false
    t.string "title", null: false
    t.string "plot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_videos_on_type"
  end

  add_foreign_key "episodes", "videos"
  add_foreign_key "purchase_options", "videos"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
end
