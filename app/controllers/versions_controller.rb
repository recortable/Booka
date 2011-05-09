class VersionsController < ApplicationController
  respond_to :html
  expose(:versions) { Version.order('id DESC') }

  def index
    authorize! :read, Version
  end
end
