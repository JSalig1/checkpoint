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

ActiveRecord::Schema.define(version: 20140508195938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaching_relationships", force: true do |t|
    t.integer  "coach_id",   null: false
    t.integer  "athlete_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coaching_relationships", ["athlete_id"], name: "index_coaching_relationships_on_athlete_id", using: :btree
  add_index "coaching_relationships", ["coach_id"], name: "index_coaching_relationships_on_coach_id", using: :btree

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.text     "description",                                  null: false
    t.date     "target_date",                                  null: false
    t.string   "status",       limit: 128, default: "current", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "completed_on"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "review_requests", force: true do |t|
    t.integer  "athlete_id", null: false
    t.integer  "coach_id",   null: false
    t.integer  "goal_id",    null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_requests", ["athlete_id"], name: "index_review_requests_on_athlete_id", using: :btree
  add_index "review_requests", ["coach_id"], name: "index_review_requests_on_coach_id", using: :btree
  add_index "review_requests", ["goal_id"], name: "index_review_requests_on_goal_id", using: :btree

  create_table "steps", force: true do |t|
    t.integer  "goal_id"
    t.text     "description",                                  null: false
    t.date     "target_date",                                  null: false
    t.string   "status",       limit: 128, default: "current", null: false
    t.date     "completed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["goal_id"], name: "index_steps_on_goal_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
