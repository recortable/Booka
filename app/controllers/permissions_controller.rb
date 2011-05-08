class PermissionsController < ApplicationController
  respond_to :html
  expose(:project) { Project.find_by_slug(params[:project_id]) }
  expose(:permissions) { project.permissions }

  def index
    authorize! :read, Permission
  end
end
