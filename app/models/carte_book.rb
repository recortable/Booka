# CarteBook
#
#  t.integer  "user_id"
#  t.string   "title",      :limit => 300
#  t.string   "subtitle",   :limit => 500
#  t.string   "editor",     :limit => 300
#  t.string   "place",      :limit => 200
#  t.date     "pub_date"
#  t.text     "contents"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#
class CarteBook < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :editor, presence: true
end
