class BookaLinesController < ApplicationController
  respond_to :html
  expose(:booka_lines) { BookaLine.all }
  expose(:booka_line) { params[:id].present? ? BookaLine.find_by_slug!(params[:id]) : BookaLine.new(params[:booka_line]) }
  expose(:booka_page) { Post.find_by_slug('booka') }
  expose(:projects) { Project.all }
  expose(:new_page_comment) { Comment.new(:resource => booka_page) }
  expose(:new_line_comment) { Comment.new(:resource => booka_line) }
  expose(:logo) { "/assets/iconos/booka.png" }

  def index
#    authorize! :read, BookaLine
  end

  def show
    authorize! :read, booka_line
  end

  def new
    authorize! :create, BookaLine
  end

  def edit
    authorize! :edit, booka_line
  end

  def create
    booka_line.user = current_user
    # TODO:remove - booka_line.project_id = 1
    authorize! :create, booka_line
    flash[:notice] = t('booka_lines.notice.create') if booka_line.save
    respond_with booka_line
  end

  def update
    authorize! :update, booka_line
    flash[:notice] = t('booka_lines.notice.update') if booka_line.update_attributes(params[:booka_line])
    respond_with booka_line
  end

end
