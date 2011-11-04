# Content
#
# SCHEMA
#create_table "contents", :force => true do |t|
#  t.integer  "project_id"                  REQUIRED
#  t.integer  "user_id"                     REQUIRED
#  t.string   "title",        :limit => 300 REQUIRED
#  t.string   "content_type", :limit => 32  REQUIRED
#  t.text     "body"                        REQUIRED
#  t.string   "author",       :limit => 100
#  t.integer  "position"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.string   "summary",      :limit => 1024
#  t.string   "category",     :limit => 32
#  t.text     "notes"
#  t.string   "render_mode",  :limit => 16
#end
class Content < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  belongs_to :user
  belongs_to :project
  has_many :assets, :as => :resource

  acts_as_list :scope => :project_id

  validates :title, :presence => true
  validates :body, :presence => true
  validates :content_type, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :visibility, :presence => true

  CONTENT_TYPES = ['text/markdown', 'text/html']
  CATEGORIES = [:essay, :project]
  RENDER_MODES = [:mixed, :text_only, :images_only]
  VISIBILITIES = [:draft, :public, :private]

  scope :public, where(visibility: 'public')
  scope :by_title, lambda {|t| where("title LIKE ?", "%#{t}%")}



  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new {|p| p.title }
  })

  def to_param
    "#{id}-#{title.parameterize}"
  end


end
