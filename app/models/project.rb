class Project < ActiveRecord::Base
  belongs_to :booka_line
  belongs_to :user
  has_many :posts
  has_many :contents
  has_many :permissions
  has_many :users, :through => :permissions

  has_paper_trail(:meta => {
      :user_id => Proc.new { |p| p.user_id },
      :project_id => Proc.new { |p| p.id },
      :title => Proc.new {|p| p.title}
  })

  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence => true

  def to_param
    self.slug
  end

end
