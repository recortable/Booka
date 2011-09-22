class Topic < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  belongs_to :user
  belongs_to :project
  has_many :responses
  has_many :proposals, :class_name => 'Proposal'
  has_many :agreements, :class_name => 'Agreement'
  has_many :tasks, :class_name => 'Task'

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.title }
  })

  validates :title, :presence => true
  validates :body, :presence => true
  validates :content_type, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
end
# == Schema Information
#
# Table name: topics
#
#  id           :integer(4)      not null, primary key
#  title        :string(300)
#  user_id      :integer(4)
#  project_id   :integer(4)
#  body         :text
#  content_type :string(32)
#  created_at   :datetime
#  updated_at   :datetime
#

