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
# == Schema Information
#
# Table name: project_proposals
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  project_id  :integer(4)
#  rol         :string(32)
#  title       :string(300)
#  authors     :string(300)
#  description :string(500)
#  file1       :string(255)
#  file2       :string(255)
#  file3       :string(255)
#  file4       :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

