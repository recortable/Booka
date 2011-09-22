class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :last_modifier, :class_name => 'User'

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.last_modifier_id }
  })


  LEVEL_ADMIN = 'admin'
  LEVEL_EDITOR = 'editor'

  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :last_modifier_id, :presence => true
end
# == Schema Information
#
# Table name: permissions
#
#  id               :integer(4)      not null, primary key
#  user_id          :integer(4)
#  project_id       :integer(4)
#  last_modifier_id :integer(4)
#  level            :string(16)
#  created_at       :datetime
#  updated_at       :datetime
#

