class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :version
  belongs_to :project
end
