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

ActiveRecord::Schema[8.0].define(version: 2025_05_14_025446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "puzzle_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_games_on_puzzle_id"
  end

  create_table "guesses", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "value"
    t.integer "guess_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_guesses_on_game_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.date "puzzle_date"
    t.integer "puzzle_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_puzzles_on_word_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "puzzles"
  add_foreign_key "guesses", "games"
  add_foreign_key "puzzles", "words"
  add_foreign_key "sessions", "users"
end
