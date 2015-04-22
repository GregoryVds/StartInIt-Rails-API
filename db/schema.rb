# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150413150647) do

  create_table "achievements", force: true do |t|
    t.integer  "achievable_id"
    t.string   "achievable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achievements", ["achievable_id", "achievable_type"], name: "index_achievements_on_achievable_id_and_achievable_type", using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "binary_answers", force: true do |t|
    t.string   "exercisable_type"
    t.integer  "exercisable_id"
    t.boolean  "value"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.text     "description"
    t.integer  "difficulty",        default: 1
    t.integer  "duration"
    t.string   "title"
    t.integer  "track_id"
    t.string   "exercisable_type"
    t.integer  "exercisable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
  end

  create_table "fill_the_blanks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logic_outputs", force: true do |t|
    t.integer  "logic_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logics", force: true do |t|
    t.integer  "inputs"
    t.integer  "max_gates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mcqs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "questions", force: true do |t|
    t.integer  "fill_the_blank_id"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_answers", force: true do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.text     "description"
    t.integer  "difficulty",     default: 1
    t.string   "name"
    t.text     "pre_requisites"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turing_machines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turing_tests", force: true do |t|
    t.integer  "turing_machine_id"
    t.string   "tape"
    t.string   "answer"
    t.integer  "direction"
    t.integer  "final_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.text     "tokens"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
