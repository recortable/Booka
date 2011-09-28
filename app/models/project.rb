# Project
#
# == Schema Information
#
# Table name: projects
#
#  id            :integer(4)      not null, primary key
#  user_id       :integer(4)  REQUIRED
#  title         :string(300) REQUIRED
#  slug          :string(100) REQUIRED
#  body          :text
#  content_type  :string(32)
#  stages        :string(32)
#  booka_line_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#
#
class Project < ActiveRecord::Base
  include Models::HasStages
  extend Models::HasNestedComments
  has_nested_comments

  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence => true

  belongs_to :booka_line
  belongs_to :user
  has_many :posts
  has_many :contents
  has_many :topics
  has_many :responses
  has_many :permissions
  has_many :users, :through => :permissions
  has_many :assets
  has_many :pages

  has_many :project_proposals

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.id },
      :title => Proc.new { |p| p.title }
  })


  def self.get(slug)
    find_by_slug!(slug)
  end

  def to_param
    self.slug
  end

end
