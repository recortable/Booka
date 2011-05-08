class NotificationsController < ApplicationController
  respond_to :html
  expose(:notifications) { Notification.all }
  expose(:notification_count) { Notification.count }

  def index
    @total = update_notifications
  end

  protected
  def update_notifications
    count = 0
    Version.where(:notified => false).each do |v|
      Version.transaction do
        project = Project.find(v.project_id)
        project.users.each do |u|
          u.notifications.create!(:version => v, :project => project, :event_at => v.created_at)
          count += 1
        end
        v.update_attribute(:notified, true)
      end
    end
    count
  end

end
