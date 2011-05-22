class SystemStatus
  attr_reader :new_notifications_count
  attr_reader :notifications_count
  attr_reader :unnotified_users
  attr_reader :user_notifications

  def initialize(user = nil)
    @notifications_count = Notification.count
    @new_notifications_count = Notification.update_notifications
    @unnotified_users = User.unnotified_users.count
    if user.present?
      @user_notifications = user.unreaded_notifications_count
    end
  end

end