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

ActiveRecord::Schema[7.2].define(version: 2024_09_16_145514) do
  create_table "anmeldungs", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "birthday"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "place"
    t.string "zipcode"
    t.string "allergies"
    t.string "stufe"
    t.string "krankenkasse"
    t.string "ahv_number"
    t.boolean "rights_to_pictures"
    t.string "message"
    t.boolean "order_pfadikravatte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hocks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "datetime"
    t.string "stufe"
    t.integer "leiter_id", null: false
    t.string "ort"
    t.index ["leiter_id"], name: "index_hocks_on_leiter_id"
  end

  create_table "leiters", force: :cascade do |t|
    t.string "pfadiname"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.string "stufe"
    t.string "funktion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "hocks", "leiters", primary_key: "id"
end
