require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: users
#
#  id                           :integer(4)      not null, primary key
#  name                         :string(100)
#  email                        :string(200)
#  roles                        :string(16)
#  notify_by_email              :boolean(1)      default(TRUE)
#  created_at                   :datetime
#  updated_at                   :datetime
#  unreaded_notifications_count :integer(4)      default(0)
#

