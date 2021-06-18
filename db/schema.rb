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

ActiveRecord::Schema.define(version: 2021_06_17_230723) do

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.integer "money", default: 10000
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players_roulettes", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "roulette_id"
    t.index ["player_id"], name: "index_players_roulettes_on_player_id"
    t.index ["roulette_id"], name: "index_players_roulettes_on_roulette_id"
  end

  create_table "roulettes", force: :cascade do |t|
    t.integer "rand_number"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
