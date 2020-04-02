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

ActiveRecord::Schema.define(version: 2020_04_02_114522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "title"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_boards_on_creator_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "creator_id"
    t.bigint "assignee_id"
    t.string "title"
    t.text "description"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignee_id"], name: "index_cards_on_assignee_id"
    t.index ["creator_id"], name: "index_cards_on_creator_id"
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "creator_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_comments_on_card_id"
    t.index ["creator_id"], name: "index_comments_on_creator_id"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "creator_id"
    t.string "title"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
    t.index ["creator_id"], name: "index_lists_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "boards", "users", column: "creator_id"
  add_foreign_key "cards", "lists"
  add_foreign_key "cards", "users", column: "assignee_id"
  add_foreign_key "cards", "users", column: "creator_id"
  add_foreign_key "comments", "cards"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "lists", "boards"
  add_foreign_key "lists", "users", column: "creator_id"
end
