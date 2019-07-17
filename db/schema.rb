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

ActiveRecord::Schema.define(version: 2019_07_16_210702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "learning_outcomes", force: :cascade do |t|
    t.text "content"
    t.boolean "completed", default: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_learning_outcomes_on_subject_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string "name"
    t.string "directory_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturers_subjects", id: false, force: :cascade do |t|
    t.bigint "lecturer_id", null: false
    t.bigint "subject_id", null: false
    t.index ["lecturer_id", "subject_id"], name: "index_lecturers_subjects_on_lecturer_id_and_subject_id"
    t.index ["subject_id", "lecturer_id"], name: "index_lecturers_subjects_on_subject_id_and_lecturer_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "learning_outcomes", "subjects"
end
