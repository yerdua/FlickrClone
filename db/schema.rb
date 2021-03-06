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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130705180250) do

  create_table "album_inclusions", :force => true do |t|
    t.integer  "photo_id",   :null => false
    t.integer  "album_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "album_inclusions", ["album_id"], :name => "index_album_inclusions_on_album_id"
  add_index "album_inclusions", ["photo_id", "album_id"], :name => "index_album_inclusions_on_photo_id_and_album_id", :unique => true
  add_index "album_inclusions", ["photo_id"], :name => "index_album_inclusions_on_photo_id"

  create_table "albums", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "albums", ["name"], :name => "index_albums_on_name"
  add_index "albums", ["owner_id"], :name => "index_albums_on_owner_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "friend_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "group_memberships", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_memberships", ["group_id"], :name => "index_group_memberships_on_group_id"
  add_index "group_memberships", ["user_id"], :name => "index_group_memberships_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "only_members", :default => true, :null => false
  end

  add_index "groups", ["name"], :name => "index_groups_on_name"
  add_index "groups", ["only_members"], :name => "index_groups_on_only_members"

  create_table "photo_shares", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photo_shares", ["group_id"], :name => "index_photo_shares_on_group_id"
  add_index "photo_shares", ["photo_id"], :name => "index_photo_shares_on_photo_id"

  create_table "photos", :force => true do |t|
    t.integer  "owner_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.string   "title"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                   :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
