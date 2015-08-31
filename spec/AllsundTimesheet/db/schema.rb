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

ActiveRecord::Schema.define(version: 20150831173845) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.integer  "client_id"
    t.decimal  "budget"
    t.decimal  "revenue"
    t.boolean  "chargeable"
    t.boolean  "productive"
    t.boolean  "utilised"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["client_id"], name: "index_activities_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costs", force: :cascade do |t|
    t.string   "name"
    t.decimal  "hourly_cost"
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "days", force: :cascade do |t|
    t.string   "timeslot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "rate_id"
    t.integer  "cost_id"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["cost_id"], name: "index_employees_on_cost_id"
  add_index "employees", ["rate_id"], name: "index_employees_on_rate_id"

  create_table "log_data", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.string   "name"
    t.decimal  "hourly_rate"
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.date     "date"
    t.integer  "employee_id"
    t.integer  "activity_id"
    t.integer  "day_id"
    t.integer  "workstream_id"
    t.string   "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "timesheets", ["activity_id"], name: "index_timesheets_on_activity_id"
  add_index "timesheets", ["day_id"], name: "index_timesheets_on_day_id"
  add_index "timesheets", ["employee_id"], name: "index_timesheets_on_employee_id"
  add_index "timesheets", ["workstream_id"], name: "index_timesheets_on_workstream_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "admin"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
  end

  create_table "workstreams", force: :cascade do |t|
    t.string   "name"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
