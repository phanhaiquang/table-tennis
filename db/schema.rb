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

ActiveRecord::Schema.define(version: 20170605035152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cup_players", force: :cascade do |t|
    t.integer  "cup_id"
    t.integer  "player_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "win",        default: 0
    t.integer  "loose",      default: 0
  end

  create_table "cups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "cup_id"
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.integer  "score_1",     default: 0
    t.integer  "score_2",     default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "star_1",      default: 0
    t.integer  "star_2",      default: 0
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
