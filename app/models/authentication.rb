class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
  validates :provider, :presence => true
  validates :uid, :presence => true

  def self.find_from_auth(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

end
