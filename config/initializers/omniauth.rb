
Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'

  require "openid/fetchers"
   OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"

  provider :open_id, OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  provider :twitter, 'cZLzgKHY9phSNDuyFImKTw', 'PV6e164UZaPW9Lq5XHW9C0k37ZZNMxLwv41ewlH8D4'

#  provider :facebook, 'APP_ID', 'APP_SECRET'
#   provider :github, 'CLIENT ID', 'SECRET'
end
