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

ActiveRecord::Schema.define(version: 2018_12_13_041914) do

  create_table "favs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_favs_on_tweet_id"
    t.index ["user_id"], name: "index_favs_on_user_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "target_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_user_id"], name: "index_follows_on_target_user_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data", null: false
    t.index ["tweet_id"], name: "index_images_on_tweet_id"
  end

  create_table "notification_favs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "fav_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fav_id"], name: "index_notification_favs_on_fav_id"
    t.index ["notification_id"], name: "index_notification_favs_on_notification_id"
  end

  create_table "notification_replies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_notification_replies_on_notification_id"
    t.index ["reply_id"], name: "index_notification_replies_on_reply_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "target_tweet_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_tweet_user_id"], name: "index_notifications_on_target_tweet_user_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "replies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "target_tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_tweet_id"], name: "index_replies_on_target_tweet_id"
    t.index ["tweet_id"], name: "index_replies_on_tweet_id"
  end

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text", null: false
    t.bigint "user_id", null: false
    t.integer "privacy_status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "mail_notice", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin_check", default: false, null: false
    t.text "image_data"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favs", "tweets"
  add_foreign_key "favs", "users"
  add_foreign_key "follows", "users"
  add_foreign_key "follows", "users", column: "target_user_id"
  add_foreign_key "images", "tweets"
  add_foreign_key "notification_favs", "favs"
  add_foreign_key "notification_favs", "notifications"
  add_foreign_key "notification_replies", "notifications"
  add_foreign_key "notification_replies", "replies"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "target_tweet_user_id"
  add_foreign_key "replies", "tweets"
  add_foreign_key "replies", "tweets", column: "target_tweet_id"
  add_foreign_key "tweets", "users"
end
