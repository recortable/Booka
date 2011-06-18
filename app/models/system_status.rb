class SystemStatus
  attr_reader :new_notifications_count
  attr_reader :notifications_count
  attr_reader :unnotified_users, :unnotified_users_count
  attr_reader :user_notifications

  def initialize(user = nil)
    @notifications_count = Notification.count
    @new_notifications_count = Notification.update_notifications
    @unnotified_users = User.unnotified_users
    @unnotified_users_count = User.unnotified_users.count
    if user.present?
      @user_notifications = user.unreaded_notifications_count
    end
  end

  def send_emails
    if @new_notifications_count == 0
      Rails.logger.debug("SYSTEM STATUS - SEND EMAIL")
      user = User.where('unreaded_notifications_count > 0').order('updated_at ASC').first
      Rails.logger.debug("SYSTEM STATUS - EMAIL TO #{user.to_json}") if user
      UserMailer.notification_email(user).deliver if user
    end
  end

end