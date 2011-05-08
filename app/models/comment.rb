class Comment < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :user
  belongs_to :project
  has_ancestry

  validates :body, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :resource_id, :presence => true
  validates :resource_type, :presence => true

end
