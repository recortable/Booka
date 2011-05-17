# encoding: utf-8

class ProjectProposal < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  1.upto(4) { |n| mount_uploader "file#{n}", ProjectProposalUploader }

  ROLES = ['materiales', 'edición']

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new {|p| p.title }
  })

  validates :rol, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
end
