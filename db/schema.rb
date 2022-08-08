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

ActiveRecord::Schema[7.0].define(version: 2015_05_16_202403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", id: :serial, force: :cascade do |t|
    t.string "hex"
    t.string "name"
  end

  create_table "periods", id: :serial, force: :cascade do |t|
    t.string "shortcode"
    t.integer "teacher_id"
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "number"
    t.integer "color_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.text "prompt"
    t.integer "rating_total"
    t.integer "rating_count"
    t.integer "teacher_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "response_sets", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "question_id"
    t.datetime "send_time", precision: nil
    t.integer "period_id"
    t.string "message_id"
    t.boolean "sms_sent"
  end

  create_table "responses", id: :serial, force: :cascade do |t|
    t.text "response_text"
    t.integer "rating"
    t.integer "student_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "response_set_id"
    t.string "sms_id"
    t.bigint "phone_number"
    t.boolean "sent"
    t.datetime "response_time", precision: nil
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.integer "period_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "teacher_id"
    t.string "email"
    t.boolean "locked"
  end

  create_table "teachers", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "time_zone"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
