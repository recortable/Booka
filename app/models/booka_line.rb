class BookaLine < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  has_many :projects
  belongs_to :project
  belongs_to :user

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new {|p| p.title}
  })



  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  def to_param
    self.slug
  end

end
