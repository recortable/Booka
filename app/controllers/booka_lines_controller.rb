class BookaLinesController < ApplicationController
  respond_to :html
  expose(:booka_lines) { BookaLine.all }
  expose(:booka_line) { params[:id].present? ? BookaLine.find_by_slug(params[:id]) : BookaLine.new(params[:booka_line])}
  expose(:booka_page) { Post.find_by_slug('booka') }
  expose(:projects) { Project.all }
  expose(:new_page_comment) { Comment.new(:resource => booka_page) }
  expose(:new_line_comment) { Comment.new(:resource => booka_line) }

  def index
  end

  def show
  end

  def new
    authorize! :create, BookaLine
  end

end
