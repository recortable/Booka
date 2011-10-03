class ContentsController < ApplicationController
  respond_to :html
  expose(:project) { Project.get(params[:project_id])}
  expose(:contents) { can?(:manage, project) ? project.contents : project.contents.public }
  expose(:content)
  expose(:new_comment) { Comment.new(:resource => content) }

  def index
    @no_grid = true
    redirect_to [project,contents.first] if project.contents.count > 0
  end

  def show
    @no_grid = true
    authorize! :read, content
  end

  def new
    authorize! :new, content
  end

  def edit
    authorize! :edit, content
  end

  def create
    build_params(params[:content], current_user)
    authorize! :create, content
    flash[:notice] = t('contents.notice.create') if content.save
    respond_with content, :location => [project, content]
  end

  def update
    authorize! :update, content
    clean_body(params[:content])
    flash[:notice] = t('contents.notice.update') if content.update_attributes(params[:content])
    respond_with content, :location => [project, content]
  end

  def destroy
    authorize! :destroy, content
    flash[:notice] = 'Contenido borrado' if content.destroy
    respond_with content, :location => project
  end
end
