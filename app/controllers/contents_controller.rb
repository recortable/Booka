class ContentsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:contents) { project.contents }
  expose(:content)
  expose(:new_comment) { Comment.new(:resource => content) }

  def index
    @no_grid = true
    redirect_to [project,contents.first]
  end

  def show
    @no_grid = true
    authorize! :read, content
  end

  def edit
    authorize! :edit, content
  end

  def update
    clean_body(params[:content])
    flash[:notice] = t('contents.notice.update') if content.update_attributes(params[:content])
    respond_with content, :location => [project, content]
  end
end
