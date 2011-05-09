class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :topic
  has_many :comments, :as => :resource

  scope :tasks, where(:type => 'Task')

  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :topic_id, :presence => true
end
