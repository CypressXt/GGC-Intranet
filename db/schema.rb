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

ActiveRecord::Schema.define(version: 20161002175319) do

  create_table "animation_participants", force: :cascade do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.integer  "animation_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "animation_participants", ["animation_id"], name: "index_animation_participants_on_animation_id"
  add_index "animation_participants", ["user_id"], name: "index_animation_participants_on_user_id"

  create_table "animations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "nb_participants"
    t.datetime "date"
    t.text     "iframe_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "animations", ["user_id"], name: "index_animations_on_user_id"

  create_table "infos", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "infos", ["user_id"], name: "index_infos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "nickname"
    t.boolean  "admin",      default: false
    t.string   "name"
    t.string   "lastname"
  end

end
