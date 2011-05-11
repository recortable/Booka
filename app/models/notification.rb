class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :version
  belongs_to :project

  scope :to_be_emailed, where(:should_be_emailed => true)

  def mark_as_mailed
    self.update_attribute(:should_be_emailed, false)
  end
end
