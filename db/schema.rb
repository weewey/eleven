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

ActiveRecord::Schema.define(version: 2019_01_13_080129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "race_id"
    t.bigint "photographer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographer_id"], name: "index_assignments_on_photographer_id"
    t.index ["race_id"], name: "index_assignments_on_race_id"
  end

  create_table "photographers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "tags", array: true
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "race_id"
    t.integer "photographer_id"
    t.index ["photographer_id"], name: "index_photos_on_photographer_id"
    t.index ["race_id"], name: "index_photos_on_race_id"
  end

  create_table "photos_runners", id: false, force: :cascade do |t|
    t.bigint "runner_id", null: false
    t.bigint "photo_id", null: false
    t.index ["photo_id"], name: "index_photos_runners_on_photo_id"
    t.index ["runner_id"], name: "index_photos_runners_on_runner_id"
  end

  create_table "race_participations", force: :cascade do |t|
    t.string "bib_number"
    t.bigint "race_id"
    t.bigint "runner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_participations_on_race_id"
    t.index ["runner_id"], name: "index_race_participations_on_runner_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "races"
end
