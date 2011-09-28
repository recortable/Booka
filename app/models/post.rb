# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)  REQUIRED
#  project_id   :integer(4)  REQUIRED
#  title        :string(255) REQUIRED
#  content_type :string(32)  REQUIRED
#  body         :text        REQUIRED
#  slug         :string(255) REQUIRED
#  published    :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#
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
  validates :slug, :presence => true
  validates :body, :presence => true
end
