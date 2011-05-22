class ReadPagesController < ApplicationController
  respond_to :html
  layout 'read'


  expose(:project) { Project.get(params[:project_id]) }
  expose(:pages) { project.pages.order('title ASC') }
  expose(:page)

  def index
    prawnto :prawn=>{:page_layout=>:portrait, :margin => [80, 50]},
            :inline => false, :filename => project.title
  end

  def show

  end
end
