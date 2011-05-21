class Page < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  belongs_to :user
  belongs_to :project

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new { |p| p.title }
  })

  def next
    @next ||= project.pages.where('id > ?', id).order('title ASC').limit(1).first
  end

  def prev
    @prev ||= project.pages.where('id < ?', id).order('title DESC').limit(1).first
  end

  validates :title, :presence => true
  validates :content_type, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
end
