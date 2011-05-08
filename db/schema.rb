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

ActiveRecord::Schema.define(:version => 20110508160944) do

  create_table "collections", :force => true do |t|
    t.string   "title",        :limit => 100
    t.string   "icon_path",    :limit => 256
    t.string   "content_type", :limit => 32
    t.text     "body"
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
    t.string   "content_type"
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "published"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["project_id"], :name => "index_posts_on_project_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title",         :limit => 300
    t.string   "description",   :limit => 512
    t.string   "stages",        :limit => 32
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["collection_id"], :name => "index_projects_on_collection_id"

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 100
    t.string   "email",      :limit => 200
    t.string   "roles",      :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"
  add_index "versions", ["project_id"], :name => "index_versions_on_project_id"

end
