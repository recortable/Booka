class Comment < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :user
  belongs_to :project
  has_ancestry

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.resource.title }
  })


  validates :body, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :resource_id, :presence => true
  validates :resource_type, :presence => true

end
