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

ActiveRecord::Schema.define(version: 20170407000000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "makers", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "opinions", force: :cascade do |t|
    t.text     "content",    null: false
    t.string   "ip",         null: false
    t.string   "user_agent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "key",                               null: false
    t.integer  "parent_id",                         null: false
    t.integer  "provider_id",                       null: false
    t.string   "name",                              null: false
    t.integer  "carrier",                           null: false
    t.integer  "data_num",          default: 0,     null: false
    t.integer  "sms_num",           default: 0,     null: false
    t.integer  "voice_num",         default: 0,     null: false
    t.integer  "capacity"
    t.integer  "price",                             null: false
    t.string   "down_speed"
    t.string   "up_speed"
    t.string   "voice_price"
    t.string   "sms_domestic"
    t.string   "sms_international"
    t.string   "carry_over"
    t.string   "admin_fee_name"
    t.string   "admin_fee"
    t.string   "add_sim"
    t.boolean  "visible",           default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["provider_id"], name: "index_plans_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "key",        null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qa_replies", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "qa_thread_id",                 null: false
    t.integer  "qa_reply_id",  default: 0,     null: false
    t.string   "content",                      null: false
    t.boolean  "updated",      default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["qa_reply_id"], name: "index_qa_replies_on_qa_reply_id", using: :btree
    t.index ["qa_thread_id"], name: "index_qa_replies_on_qa_thread_id", using: :btree
    t.index ["user_id"], name: "index_qa_replies_on_user_id", using: :btree
  end

  create_table "qa_threads", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.string   "title",                      null: false
    t.integer  "carrier",                    null: false
    t.string   "terminal",                   null: false
    t.string   "content",                    null: false
    t.boolean  "updated",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_qa_threads_on_user_id", using: :btree
  end

  create_table "simulation_results", force: :cascade do |t|
    t.uuid     "simulation_id", null: false
    t.integer  "plan_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["plan_id"], name: "index_simulation_results_on_plan_id", using: :btree
  end

  create_table "simulations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "carrier",    null: false
    t.integer  "capacity",   null: false
    t.boolean  "voice",      null: false
    t.boolean  "sms",        null: false
    t.integer  "speed",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terminals", force: :cascade do |t|
    t.string  "name",                        null: false
    t.integer "maker_id",                    null: false
    t.integer "carrier",                     null: false
    t.boolean "band1",       default: false, null: false
    t.boolean "band3",       default: false, null: false
    t.boolean "band8",       default: false, null: false
    t.boolean "band11",      default: false, null: false
    t.boolean "band18_26",   default: false, null: false
    t.boolean "band19",      default: false, null: false
    t.boolean "band21",      default: false, null: false
    t.boolean "band28",      default: false, null: false
    t.boolean "wc_band1",    default: false, null: false
    t.boolean "wc_band6_19", default: false, null: false
    t.boolean "wc_band8",    default: false, null: false
    t.boolean "wc_band9",    default: false, null: false
    t.boolean "wc_band11",   default: false, null: false
    t.index ["maker_id"], name: "index_terminals_on_maker_id", using: :btree
  end

  create_table "thread_categories", force: :cascade do |t|
    t.integer  "qa_thred_id", null: false
    t.integer  "category",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["qa_thred_id"], name: "index_thread_categories_on_qa_thred_id", using: :btree
  end

  create_table "thread_labels", force: :cascade do |t|
    t.integer  "qa_thred_id", null: false
    t.integer  "label",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["qa_thred_id"], name: "index_thread_labels_on_qa_thred_id", using: :btree
  end

  create_table "thread_tags", force: :cascade do |t|
    t.integer  "qa_thred_id", null: false
    t.integer  "tag",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["qa_thred_id"], name: "index_thread_tags_on_qa_thred_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
