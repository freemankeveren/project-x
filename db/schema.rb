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

ActiveRecord::Schema.define(version: 20170929171501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.integer "dob"
    t.string "picture"
    t.integer "maiden_name"
    t.string "tag"
    t.string "template"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_admins_on_school_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.integer "dob"
    t.string "picture"
    t.integer "maiden_name"
    t.string "tag"
    t.string "template"
    t.bigint "admin_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_instructors_on_admin_id"
    t.index ["school_id"], name: "index_instructors_on_school_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_organizations_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.string "location"
    t.integer "phone"
    t.bigint "owner_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_schools_on_organization_id"
    t.index ["owner_id"], name: "index_schools_on_owner_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.integer "dob"
    t.string "picture"
    t.integer "maiden_name"
    t.string "tag"
    t.string "template"
    t.bigint "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_students_on_instructor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "admins", "schools"
  add_foreign_key "instructors", "admins"
  add_foreign_key "instructors", "schools"
  add_foreign_key "organizations", "owners"
  add_foreign_key "schools", "organizations"
  add_foreign_key "schools", "owners"
  add_foreign_key "students", "instructors"
end
