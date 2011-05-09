class ProjectsController < ApplicationController
  respond_to :html
  expose(:project) { params[:id].present? ? Project.find_by_slug(params[:id]) : Project.new(params[:project]) }
  expose(:new_comment) { Comment.new(:resource => project)}

  def show
    authorize! :read, project
  end
end
