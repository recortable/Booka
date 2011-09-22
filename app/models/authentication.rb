class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
  validates :provider, :presence => true
  validates :uid, :presence => true

  def self.find_from_auth(hash)

  end

end
# == Schema Information
#
# Table name: authentications
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

