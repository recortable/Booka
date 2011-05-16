class ProjectsController < ApplicationController
  respond_to :html
  expose(:project) { params[:id].present? ? Project.get(params[:id]) : Project.new(params[:project]) }
  expose(:new_comment) { Comment.new(:resource => project)}
  expose(:logo) { project.booka_line ? project.booka_line.icon_path : '/assets/iconos/booka.png' }

  def show
    authorize! :read, project
  end

  def edit
    authorize! :edit, project
  end

  def update
    authorize! :update, project
    flash[:notice] = t('projects.notice.create') if project.update_attributes(params[:project])
    respond_with project
  end

end
