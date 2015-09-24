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

ActiveRecord::Schema.define(:version => 20150924134824) do

  create_table "action_quotes", :force => true do |t|
    t.text     "content"
    t.boolean  "display"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "content"
    t.string   "image"
    t.string   "image_alt"
    t.string   "slug"
    t.date     "date"
    t.boolean  "display"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "snippet"
    t.string   "link"
    t.string   "image"
    t.boolean  "display",    :default => true
    t.integer  "position",   :default => 0
    t.string   "link_text"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "body_part_sections", :force => true do |t|
    t.integer  "body_part_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "display",      :default => true
    t.integer  "position",     :default => 0
    t.string   "slug"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "body_part_sections", ["body_part_id"], :name => "index_body_part_sections_on_body_part_id"

  create_table "body_parts", :force => true do |t|
    t.string   "name"
    t.text     "introduction"
    t.string   "image"
    t.boolean  "display",      :default => true
    t.integer  "position",     :default => 0
    t.string   "slug"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "bookings", :force => true do |t|
    t.text     "clinic"
    t.integer  "treatment_id"
    t.date     "date"
    t.time     "time"
    t.string   "name"
    t.string   "contact_number"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "bookings", ["treatment_id"], :name => "index_bookings_on_treatment_id"

  create_table "chronicler_documents", :force => true do |t|
    t.string   "name"
    t.string   "document"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chronicler_images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "manticore_administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_send_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "layout"
    t.string   "style"
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.string   "slug"
    t.boolean  "display",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "prices", :force => true do |t|
    t.string   "title"
    t.text     "price"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "position"
    t.boolean  "display"
    t.boolean  "show_read_more"
  end

  create_table "seo_entries", :force => true do |t|
    t.string   "nominal_url"
    t.string   "title"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.boolean  "in_sitemap",                                      :default => true
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.string   "item_reviewed"
    t.decimal  "rating",            :precision => 4, :scale => 1
    t.integer  "max_rating"
    t.integer  "number_of_reviews"
  end

  create_table "team_members", :force => true do |t|
    t.integer  "position"
    t.string   "role"
    t.text     "bio"
    t.string   "image"
    t.boolean  "display"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "qualification"
    t.text     "name"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "position",   :default => 0
    t.boolean  "display",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tracking_codes", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.text     "code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "tracking_codes", ["trackable_id", "trackable_type"], :name => "index_tracking_codes_on_trackable_id_and_trackable_type"

  create_table "treatments", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "content"
    t.boolean  "display"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
    t.string   "image"
  end

  create_table "willow_branches", :force => true do |t|
    t.string   "tree"
    t.string   "name"
    t.integer  "position",              :default => 0
    t.string   "ancestry"
    t.integer  "ancestry_depth",        :default => 0
    t.string   "positions_depth_cache"
    t.integer  "leaf_id"
    t.string   "leaf_type"
    t.boolean  "sturdy",                :default => false
    t.boolean  "can_have_children",     :default => false
    t.boolean  "primary",               :default => false
    t.string   "access_key"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "willow_branches", ["ancestry"], :name => "index_willow_branches_on_ancestry"

  create_table "willow_leaves", :force => true do |t|
    t.string "name"
    t.string "route"
    t.string "type"
  end

end
