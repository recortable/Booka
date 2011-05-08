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

ActiveRecord::Schema.define(:version => 20110508200938) do

  create_table "booka_lines", :force => true do |t|
    t.string   "title",        :limit => 300
    t.string   "slug",         :limit => 100
    t.string   "icon_path",    :limit => 256
    t.string   "content_type", :limit => 32
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "booka_lines", ["slug"], :name => "index_booka_lines_on_slug"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["ancestry"], :name => "index_comments_on_ancestry"
  add_index "comments", ["resource_id"], :name => "index_comments_on_resource_id"
  add_index "comments", ["resource_type"], :name => "index_comments_on_resource_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contents", :force => true do |t|
    t.string   "title",        :limit => 300
    t.string   "author",       :limit => 100
    t.integer  "position"
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "body"
    t.string   "content_type", :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "level",      :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["project_id"], :name => "index_permissions_on_project_id"
  add_index "permissions", ["user_id"], :name => "index_permissions_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "content_type", :limit => 32
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "published",                  :default => true
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["project_id"], :name => "index_posts_on_project_id"
  add_index "posts", ["slug"], :name => "index_posts_on_slug"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title",         :limit => 300
    t.string   "slug",          :limit => 100
    t.text     "body"
    t.string   "content_type",  :limit => 32
    t.string   "stages",        :limit => 32
    t.integer  "booka_line_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["booka_line_id"], :name => "index_projects_on_booka_line_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 100
    t.string   "email",      :limit => 200
    t.string   "roles",      :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",                 :null => false
    t.integer  "item_id",                   :null => false
    t.string   "event",                     :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "title",      :limit => 300
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"
  add_index "versions", ["project_id"], :name => "index_versions_on_project_id"

end
