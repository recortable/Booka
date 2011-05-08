class User < ActiveRecord::Base
  include Models::RolesMethods
  has_many :permissions
  has_many :project, :through => :permissions

end
