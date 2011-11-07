class Alacarte::ApplicationController < ApplicationController
  respond_to :html, :json

  http_basic_authenticate_with :name => "booka", :password => "booka"
end
