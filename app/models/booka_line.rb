class BookaLine < ActiveRecord::Base
  has_many :projects
  belongs_to :project
  has_many :comments, :as => :resource

  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  def to_param
    self.slug
  end

end
