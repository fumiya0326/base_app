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

ActiveRecord::Schema.define(version: 20200304164728) do

  create_table "browsing_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "sule_id"
  end

  create_table "comment_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "comme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reply_id"
  end

  create_table "commes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sule_id"
    t.integer "user_id"
    t.string "image"
    t.index ["sule_id"], name: "index_commes_on_sule_id"
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "follower_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id", "follower_id"], name: "index_relationships_on_follow_id_and_follower_id", unique: true
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "replies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "reply"
    t.bigint "user_id"
    t.bigint "comme_id"
    t.bigint "sule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["comme_id"], name: "index_replies_on_comme_id"
    t.index ["sule_id"], name: "index_replies_on_sule_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "sules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teamatr"
    t.text "content"
    t.string "image"
    t.float "ikioi", limit: 24
    t.integer "user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "fav_team"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commes", "sules"
  add_foreign_key "replies", "commes"
  add_foreign_key "replies", "sules"
  add_foreign_key "replies", "users"
end
