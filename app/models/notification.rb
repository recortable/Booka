class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :version
  belongs_to :project

  scope :to_be_emailed, where(:should_be_emailed => true)

  def mark_as_mailed
    self.update_attribute(:should_be_emailed, false)
  end

  def self.update_notifications
    count = 0
    Version.where(:notified => false).each do |v|
      Version.transaction do
        project = Project.find(v.project_id)
        project.users.each do |u|
          u.notifications.create!(:version => v, :project => project, :event_at => v.created_at,
            :should_be_emailed => u.notify_by_email)
          count += 1
        end
        v.update_attribute(:notified, true)
      end
    end
    count
  end
end
