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

ActiveRecord::Schema.define(version: 20170110190730) do

  create_table "analyses", force: true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.boolean  "option_a"
    t.boolean  "option_b"
    t.boolean  "option_c"
    t.boolean  "option_d"
    t.boolean  "answered",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "analyses", ["survey_id"], name: "index_analyses_on_survey_id"
  add_index "analyses", ["user_id", "survey_id"], name: "index_analyses_on_user_id_and_survey_id", unique: true
  add_index "analyses", ["user_id"], name: "index_analyses_on_user_id"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "stats", force: true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.boolean  "option_a",   default: false
    t.boolean  "option_b",   default: false
    t.boolean  "option_c",   default: false
    t.boolean  "option_d",   default: false
    t.boolean  "answered",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["survey_id"], name: "index_stats_on_survey_id"
  add_index "stats", ["user_id", "survey_id"], name: "index_stats_on_user_id_and_survey_id", unique: true
  add_index "stats", ["user_id"], name: "index_stats_on_user_id"

  create_table "surveys", force: true do |t|
    t.text     "question"
    t.string   "option_a"
    t.string   "option_b"
    t.string   "option_c"
    t.string   "option_d"
    t.integer  "option_a_count", default: 0
    t.integer  "option_b_count", default: 0
    t.integer  "option_c_count", default: 0
    t.integer  "option_d_count", default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_count",   default: 0
  end

  add_index "surveys", ["id", "user_id"], name: "index_surveys_on_id_and_user_id"
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
