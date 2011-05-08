class ContentsController < ApplicationController
  respond_to :html
  expose(:project) { Project.find_by_slug(params[:project_id])}
  expose(:contents) { project.contents }
  expose(:content)

  def index
    redirect_to [project,contents.first]
  end

  def show
    authorize! :read, content
  end
end
