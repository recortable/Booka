# == Schema Information
#
# Table name: pages
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
class Page < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments
  acts_as_list scope: :project_id

  default_scope order: 'position ASC'

  belongs_to :user
  belongs_to :project

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.title }
  })

  #def next
  #  @next ||= project.pages.where('id > ?', id).order('title ASC').limit(1).first
  #end
  #
  #def prev
  #  @prev ||= project.pages.where('id < ?', id).order('title DESC').limit(1).first
  #end

  validates :title, :presence => true
  validates :content_type, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
  validates :status, :presence => true

  def status?(status)
    self.status == status.to_s
  end

end


