# == Schema Information
#
# Table name: booka_lines
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)  REQUIRED
#  title        :string(300) REQUIRED
#  slug         :string(100) REQUIRED
#  icon_path    :string(256)
#  content_type :string(32)
#  project_id   :integer(4)  # TODO: remove
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#
class BookaLine < ActiveRecord::Base
  extend Models::HasNestedComments
  has_nested_comments

  has_many :projects
  #belongs_to :project
  belongs_to :user

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
   #   :project_id => Proc.new { |p| p.project_id },
      :title => Proc.new {|p| p.title}
  })



  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence => true
  #validates :project_id, :presence => true

  def to_param
    self.slug
  end

end
