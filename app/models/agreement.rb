# == Schema Information
#
# Table name: responses
#
#  id           :integer(4)      not null, primary key
#  type         :string(16)
#  title        :string(100)
#  user_id      :integer(4)
#  project_id   :integer(4)
#  topic_id     :integer(4)
#  content_type :string(32)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#
class Agreement < Response
end
