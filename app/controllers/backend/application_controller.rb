class Backend::ApplicationController < ApplicationController
  layout 'backend'
  http_basic_authenticate_with :name => "admin", :password => "admin"
end
