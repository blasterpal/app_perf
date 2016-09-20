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

ActiveRecord::Schema.define(version: 20160917212236) do

  create_table "analytic_event_data", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "host_id"
    t.datetime "timestamp"
    t.string   "name"
    t.float    "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "analytic_event_data", ["application_id"], name: "index_analytic_event_data_on_application_id"
  add_index "analytic_event_data", ["host_id"], name: "index_analytic_event_data_on_host_id"

  create_table "applications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "license_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "database_calls", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "database_type_id"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "database_calls", ["application_id"], name: "index_database_calls_on_application_id"
  add_index "database_calls", ["database_type_id"], name: "index_database_calls_on_database_type_id"

  create_table "database_types", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "database_types", ["application_id"], name: "index_database_types_on_application_id"

  create_table "error_data", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "host_id"
    t.integer  "error_message_id"
    t.string   "transaction_id"
    t.string   "message"
    t.text     "backtrace"
    t.datetime "timestamp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "error_data", ["application_id"], name: "index_error_data_on_application_id"
  add_index "error_data", ["error_message_id"], name: "index_error_data_on_error_message_id"
  add_index "error_data", ["host_id"], name: "index_error_data_on_host_id"

  create_table "error_messages", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "fingerprint"
    t.string   "error_class"
    t.string   "error_message"
    t.datetime "last_error_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "error_messages", ["application_id"], name: "index_error_messages_on_application_id"

  create_table "hosts", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hosts", ["application_id"], name: "index_hosts_on_application_id"

  create_table "transaction_data", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "host_id"
    t.integer  "transaction_endpoint_id"
    t.datetime "timestamp"
    t.integer  "call_count"
    t.float    "duration"
    t.float    "avg"
    t.float    "min"
    t.float    "max"
    t.float    "sum_sqr"
    t.integer  "middleware_call_count"
    t.float    "middleware_duration"
    t.integer  "app_call_count"
    t.float    "app_duration"
    t.integer  "view_call_count"
    t.float    "view_duration"
    t.integer  "db_call_count"
    t.float    "db_duration"
    t.integer  "gc_call_count"
    t.float    "gc_duration"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "transaction_data", ["application_id"], name: "index_transaction_data_on_application_id"
  add_index "transaction_data", ["host_id"], name: "index_transaction_data_on_host_id"
  add_index "transaction_data", ["transaction_endpoint_id"], name: "index_transaction_data_on_transaction_endpoint_id"

  create_table "transaction_endpoints", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "transaction_endpoints", ["application_id"], name: "index_transaction_endpoints_on_application_id"

  create_table "transaction_sample_data", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "host_id"
    t.integer  "grouping_id"
    t.string   "grouping_type"
    t.integer  "transaction_endpoint_id"
    t.string   "name"
    t.datetime "timestamp"
    t.string   "transaction_id"
    t.text     "payload"
    t.float    "duration"
    t.float    "exclusive_duration"
    t.float    "db_duration"
    t.float    "view_duration"
    t.float    "gc_duration"
    t.integer  "request_id"
    t.integer  "parent_id"
    t.string   "action"
    t.string   "category"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "trace_id"
  end

  add_index "transaction_sample_data", ["application_id"], name: "index_transaction_sample_data_on_application_id"
  add_index "transaction_sample_data", ["grouping_type", "grouping_id"], name: "index_transaction_sample_data_on_grouping_type_and_grouping_id"
  add_index "transaction_sample_data", ["host_id"], name: "index_transaction_sample_data_on_host_id"
  add_index "transaction_sample_data", ["trace_id"], name: "index_transaction_sample_data_on_trace_id"
  add_index "transaction_sample_data", ["transaction_endpoint_id"], name: "index_transaction_sample_data_on_transaction_endpoint_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
