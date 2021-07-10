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

ActiveRecord::Schema.define(version: 2021_07_10_031306) do

  create_table "character_bases", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "sanity"
    t.integer "willpower"
    t.integer "intellect"
    t.integer "combat"
    t.integer "agility"
    t.string "category"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "chracter_base_id", null: false
    t.integer "victory_points_gained"
    t.integer "victory_points_used"
    t.integer "health"
    t.integer "sanity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chracter_base_id"], name: "index_characters_on_chracter_base_id"
    t.index ["game_id"], name: "index_characters_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "scenario_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scenario_id"], name: "index_notes_on_scenario_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "title"
    t.integer "order_number"
    t.boolean "completion_status"
    t.integer "run_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_scenarios_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "chracter_bases", column: "chracter_base_id"
  add_foreign_key "characters", "games"
  add_foreign_key "games", "users"
  add_foreign_key "notes", "scenarios"
  add_foreign_key "scenarios", "games"
end
