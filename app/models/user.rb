class User < ActiveRecord::Base
  include Models::RolesMethods
  has_many :permissions
  has_many :projects, :through => :permissions
  has_many :notifications, :order => 'event_at DESC'
  has_many :authentications

  def self.anonymous
    User.find(2)
  end

  def to_param
    "#{id}-#{name}"
  end

  def generate_code
    Digest::MD5.hexdigest(email.to_s)
  end
end
