class Comment < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :user
  belongs_to :project
#  acts_as_list :scope => 'resource_id = #{resource_id} AND resource_type = \'#{resource_type}\''
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

  def locate_resource
    case self.resource_type
      when 'BookaLine'
        [self.resource]
      when 'Project'
        [self.project]
      else
        [self.project, self.resource]
    end
  end
end
# == Schema Information
#
# Table name: comments
#
#  id            :integer(4)      not null, primary key
#  body          :text
#  user_id       :integer(4)
#  project_id    :integer(4)
#  resource_id   :integer(4)
#  resource_type :string(255)
#  ancestry      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer(4)
#

