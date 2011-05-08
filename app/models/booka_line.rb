class BookaLine < ActiveRecord::Base
  has_many :projects

  validates :title, :presence => true
  validates :slug, :presence => true

  def to_param
    self.slug
  end

end
