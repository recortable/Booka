class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :topic
  has_many :comments, :as => :resource

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.title },
      :sub_type => Proc.new { |p| p.type }
  })

  scope :tasks, where(:type => 'Task')
  scope :proposals, where(:type => 'Proposal')
  scope :agreements, where(:type => 'Agreement')

  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :topic_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true
end

# == Schema Information
#
# Table name: responses
#
#  id           :integer(4)      not null, primary key
#  type         :string(16)
#  title        :string(100)
#  user_id      :integer(4)
#  project_id   :integer(4)
#  topic_id     :integer(4)
#  content_type :string(32)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

