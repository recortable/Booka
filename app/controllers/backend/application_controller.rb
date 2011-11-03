class Backend::ApplicationController < ApplicationController
  layout 'backend'
  before_filter :require_super
end
