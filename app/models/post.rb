class Post < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  belongs_to :user
  belongs_to :project

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.title }
  })

  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :title, :presence => true
  validates :content_type, :presence => true
  validates :body, :presence => true
end
# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  body         :text
#  content_type :string(32)
#  user_id      :integer(4)
#  project_id   :integer(4)
#  published    :boolean(1)      default(TRUE)
#  slug         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

