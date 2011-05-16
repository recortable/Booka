class PagesController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:pages) { project.pages.order('title ASC') }
  expose(:page)

  def index
    redirect_to [project, pages.first]
  end

  def show
    authorize! :read, page
  end
end
