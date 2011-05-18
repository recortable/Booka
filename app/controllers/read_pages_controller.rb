class ReadPagesController < ApplicationController
  respond_to :html
  layout 'read'

  expose(:project) { Project.get(params[:project_id]) }
  expose(:pages) { project.pages.order('title ASC') }
  expose(:page)

  def index

  end

  def show

  end
end
