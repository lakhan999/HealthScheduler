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

ActiveRecord::Schema[7.2].define(version: 2024_09_17_085037) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.time "appointment_time"
    t.string "reason"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "pending"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "doctor_availabilities", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_availabilities_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.text "address"
    t.string "specialization"
    t.integer "consultation_fees"
    t.integer "experians"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.text "address"
    t.string "blood_group"
    t.string "medical_history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "mobile_number", null: false
    t.integer "role", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "users"
  add_foreign_key "doctor_availabilities", "doctors"
  add_foreign_key "patients", "users"
end
