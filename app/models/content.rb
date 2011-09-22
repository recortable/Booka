# == Schema Information
#
# Table name: contents
#
#  id           :integer(4)      not null, primary key
#  title        :string(300)
#  author       :string(100)
#  position     :integer(4)
#  user_id      :integer(4)
#  project_id   :integer(4)
#  body         :text
#  content_type :string(32)
#  created_at   :datetime
#  updated_at   :datetime
#
class Content < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  belongs_to :user
  belongs_to :project
  has_many :assets, :as => :resource

  acts_as_list :scope => :project_id

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new {|p| p.title }
  })

  validates :title, :presence => true
  validates :body, :presence => true
  validates :content_type, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  def to_param
    "#{id}-#{title.parameterize}"
  end


end
