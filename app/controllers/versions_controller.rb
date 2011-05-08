class VersionsController < ApplicationController
  respond_to :html
  expose(:versions) { Version.all }

  def index
    authorize! :read, Version
  end
end
