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

ActiveRecord::Schema.define(version: 2020_09_11_091749) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.bigint "district_id", null: false
    t.bigint "taluka_id", null: false
    t.string "pincode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["taluka_id"], name: "index_addresses_on_taluka_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
ActiveRecord::Schema.define(version: 2020_09_08_114836) do

  create_table "attendances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.boolean "is_present"
    t.bigint "student_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["teacher_id"], name: "index_attendances_on_teacher_id"
  end

  create_table "classrooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "division"
    t.string "medium"
    t.integer "intake"
    t.bigint "teacher_id", null: false
    t.bigint "standard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["standard_id"], name: "index_classrooms_on_standard_id"
    t.index ["teacher_id"], name: "index_classrooms_on_teacher_id"
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "districts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "standards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mother_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "aadhaar_card_number"
    t.string "town"
    t.boolean "is_handicap"
    t.text "handicap_details"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.bigint "standard_id"
    t.bigint "classroom_id"
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
    t.index ["standard_id"], name: "index_students_on_standard_id"
  end

  create_table "talukas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "district_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["district_id"], name: "index_talukas_on_district_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mother_name"
    t.string "gender"
    t.date "date_of_birth"
    t.date "date_of_join"
    t.string "aadhaar_card_number"
    t.string "education"
    t.string "speciality"
    t.string "contact"
    t.string "alternate_contact"
    t.text "address"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "login_id"
    t.string "login_type"
    t.index ["login_id", "login_type"], name: "index_users_on_login_id_and_login_type"
  end

  add_foreign_key "attendances", "students"
  add_foreign_key "attendances", "teachers"
  add_foreign_key "classrooms", "standards"
  add_foreign_key "classrooms", "teachers"
  add_foreign_key "districts", "states"
  add_foreign_key "states", "countries"
  add_foreign_key "talukas", "districts"
end
