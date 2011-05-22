class User < ActiveRecord::Base
  include Models::RolesMethods
  has_many :permissions
  has_many :projects, :through => :permissions
  has_many :notifications, :order => 'event_at DESC'
  has_many :unreaded_notifications, :class_name => 'Notification', :order => 'event_at DESC', :conditions => 'notifications.should_be_emailed = true'
  has_many :authentications

  scope :unnotified_users, :conditions => 'unreaded_notifications_count > 0'

  def self.anonymous
    User.find(2)
  end

  def to_param
    "#{id}-#{name}"
  end

  def generate_code
    Digest::MD5.hexdigest(email.to_s)
  end

  def update_notifications_count
    update_attribute(:unreaded_notifications_count, self.unreaded_notifications.count)
  end

end
