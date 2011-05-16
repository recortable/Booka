class PermissionsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id]) }
  expose(:permissions) { project.permissions }
  expose(:versions) { Version.where(:project_id => project.id).order('created_at DESC') }
  expose(:posts) { project.posts.where(:published => true)}

  def index
    authorize! :read, Permission
    @hide_project_version = true
  end
end
