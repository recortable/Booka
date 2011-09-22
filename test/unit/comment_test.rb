require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: comments
#
#  id            :integer(4)      not null, primary key
#  body          :text
#  user_id       :integer(4)
#  project_id    :integer(4)
#  resource_id   :integer(4)
#  resource_type :string(255)
#  ancestry      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer(4)
#

