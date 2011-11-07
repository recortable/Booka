class ReadPagesController < ApplicationController
  respond_to :html
  layout 'read'


  expose(:project) { Project.get(params[:project_id]) }
  expose(:pages) { project.pages.order('position ASC') }
  expose(:page)

  def index

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReadPagesPdf.new(project, pages, view_context)
        send_data pdf.render, filename: "#{project.title}.pdf",
                  type: "application/pdf", disposition: "inline"
      end
    end


    prawnto :prawn=>{:page_layout=>:portrait, :margin => [80, 50]},
            :inline => false, :filename => project.title
  end

  def show

  end
end
