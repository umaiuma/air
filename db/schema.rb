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

ActiveRecord::Schema.define(version: 20170915090457) do

  create_table "chapters", force: :cascade do |t|
    t.integer "subject_id"
    t.string "name"
    t.float "level"
    t.boolean "onExam"
    t.boolean "onStudy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_chapters_on_subject_id"
  end

  create_table "dic_chapters", force: :cascade do |t|
    t.string "name"
    t.integer "dic_subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dic_subject_id"], name: "index_dic_chapters_on_dic_subject_id"
  end

  create_table "dic_groups", force: :cascade do |t|
    t.string "name"
    t.integer "dic_chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dic_chapter_id"], name: "index_dic_groups_on_dic_chapter_id"
  end

  create_table "dic_subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "chapter_id"
    t.string "name"
    t.float "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_groups_on_chapter_id"
  end

  create_table "history_problems", force: :cascade do |t|
    t.integer "problem_id"
    t.integer "user_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_history_problems_on_user_id"
  end

  create_table "meters", force: :cascade do |t|
    t.integer "user_id"
    t.string "pattern_name"
    t.string "chapter_name"
    t.float "score"
    t.float "combo"
    t.float "sign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meters_on_user_id"
  end

  create_table "parts", force: :cascade do |t|
    t.integer "pattern_id"
    t.integer "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_parts_on_pattern_id"
    t.index ["problem_id"], name: "index_parts_on_problem_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.string "subject_name"
    t.string "chapter_name"
    t.string "problem_html"
    t.string "solution_html"
    t.integer "difficulty"
    t.string "answer"
    t.string "prev_problem"
    t.string "next_problem"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "exam_id"
    t.string "name"
    t.boolean "onExam"
    t.boolean "onStudy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_subjects_on_exam_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
