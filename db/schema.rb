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

ActiveRecord::Schema.define(:version => 20140827164828) do

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tier_id"
    t.float    "price"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.string   "pay_type"
    t.integer  "payment_id"
    t.string   "email"
    t.string   "tier_name"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "position"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "payment_status"
    t.integer  "cart_id"
    t.string   "transaction_id"
    t.string   "platform_1"
    t.string   "platform_2"
    t.string   "tshirt"
    t.string   "ingame_name"
    t.boolean  "sword_legal",    :default => false
    t.boolean  "agree",          :default => false
    t.string   "state_code"
    t.string   "zip"
    t.float    "shipping_price", :default => 0.0
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale",                :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale",           :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_refinery_page_translations_on_refinery_page_id"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_projects", :force => true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "long_description"
    t.float    "goal"
    t.integer  "main_image_id"
    t.integer  "image_1_id"
    t.integer  "image_2_id"
    t.integer  "image_3_id"
    t.integer  "image_4_id"
    t.integer  "image_5_id"
    t.boolean  "active"
    t.string   "video"
    t.text     "faq"
    t.text     "terms"
    t.text     "updates"
    t.integer  "position"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "goal_text"
    t.float    "shipping_price",    :default => 0.0
  end

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_tiers", :force => true do |t|
    t.string   "title"
    t.float    "price"
    t.integer  "limit"
    t.boolean  "physical"
    t.text     "short_description"
    t.text     "long_description"
    t.boolean  "active"
    t.integer  "image_1_id"
    t.integer  "image_2_id"
    t.integer  "image_3_id"
    t.integer  "project_id"
    t.integer  "position"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "platform_1",        :default => false
    t.boolean  "platform_2",        :default => false
    t.boolean  "tshirt",            :default => false
    t.boolean  "ingame_name",       :default => false
    t.boolean  "sword_legal",       :default => false
    t.text     "side_text"
    t.text     "price_text"
    t.boolean  "kickstarter",       :default => false
    t.string   "badge_title"
  end

  create_table "refinery_user_histories", :force => true do |t|
    t.integer  "user_id"
    t.string   "field"
    t.string   "original_value"
    t.string   "new_value"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",                                  :null => false
    t.string   "email",                                     :null => false
    t.string   "encrypted_password",                        :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "slug"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.boolean  "activated",              :default => false
    t.string   "activation_token"
    t.integer  "age",                    :default => 0
    t.string   "state_code"
    t.string   "zip"
    t.string   "salt"
    t.string   "hash_password"
    t.boolean  "is_forum_user",          :default => false
    t.text     "note"
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"
  add_index "refinery_users", ["slug"], :name => "index_refinery_users_on_slug"

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "id_type_index_on_seo_meta"

  create_table "user_badges", :force => true do |t|
    t.string   "email"
    t.string   "badge_title"
    t.integer  "tier_id"
    t.boolean  "added",       :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "user_pledges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tier_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
