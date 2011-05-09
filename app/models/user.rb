class User < ActiveRecord::Base
  include Models::RolesMethods
  has_many :permissions
  has_many :projects, :through => :permissions
  has_many :notifications, :order => 'event_at DESC'

  def generate_code
    Digest::MD5.hexdigest(email.to_s)
  end
end
