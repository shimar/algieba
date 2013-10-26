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

ActiveRecord::Schema.define(version: 20131026060921) do

  create_table "data_functions", force: true do |t|
    t.integer  "user_id"
    t.integer  "software_id"
    t.string   "type"
    t.integer  "det"
    t.integer  "ret"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "softwares", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "measure_method", default: 0
  end

  create_table "transactional_functions", force: true do |t|
    t.integer  "user_id"
    t.integer  "software_id"
    t.string   "name"
    t.string   "type"
    t.integer  "det"
    t.integer  "ftr"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vafs", force: true do |t|
    t.integer  "user_id"
    t.integer  "software_id"
    t.integer  "data_communication",          default: 0
    t.integer  "distributed_data_processing", default: 0
    t.integer  "performance",                 default: 0
    t.integer  "heavily_used_configuration",  default: 0
    t.integer  "transaction_rate",            default: 0
    t.integer  "online_data_entry",           default: 0
    t.integer  "end_user_effeciency",         default: 0
    t.integer  "online_update",               default: 0
    t.integer  "complex_processing",          default: 0
    t.integer  "reusability",                 default: 0
    t.integer  "installation_ease",           default: 0
    t.integer  "operational_ease",            default: 0
    t.integer  "multiple_sites",              default: 0
    t.integer  "facilitate_change",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
