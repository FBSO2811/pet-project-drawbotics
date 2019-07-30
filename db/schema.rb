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

ActiveRecord::Schema.define(version: 2019_07_30_093234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "angellist"
    t.string "linkedin"
    t.string "skill", default: [], array: true
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "candidatures", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "interviewer_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidatures_on_candidate_id"
    t.index ["interviewer_id"], name: "index_candidatures_on_interviewer_id"
    t.index ["position_id"], name: "index_candidatures_on_position_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "interviewer"
    t.string "firstname"
    t.string "lastname"
    t.string "position"
    t.string "expertises_array", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "interviewers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expertises", default: [], array: true
    t.index ["email"], name: "index_interviewers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_interviewers_on_reset_password_token", unique: true
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.bigint "interviewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "candidate_id"
    t.string "array_skills", default: [], array: true
    t.string "skills"
    t.index ["candidate_id"], name: "index_positions_on_candidate_id"
    t.index ["interviewer_id"], name: "index_positions_on_interviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidatures", "candidates"
  add_foreign_key "candidatures", "interviewers"
  add_foreign_key "candidatures", "positions"
  add_foreign_key "positions", "candidates"
  add_foreign_key "positions", "interviewers"
end
