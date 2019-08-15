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

ActiveRecord::Schema.define(version: 2019_08_11_005457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "location_data", force: :cascade do |t|
    t.integer "source"
    t.integer "start_node"
    t.integer "end_node"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "pass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pass_id"], name: "index_location_data_on_pass_id"
    t.index ["source"], name: "index_location_data_on_source"
  end

  create_table "passes", force: :cascade do |t|
    t.string "username"
    t.text "phrase_bidx"
    t.text "phrase_ciphertext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phrase_bidx"], name: "index_passes_on_phrase_bidx"
  end

end
