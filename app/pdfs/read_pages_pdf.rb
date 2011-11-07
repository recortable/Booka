# encoding: utf-8
class ReadPagesPdf < ApplicationPdf

  # @param project [Project]
  # @param pages [Page]
  def initialize(project, pages, view)
    super()
    @project = project
    @pages = pages
    @view = view
    index_page
    content_pages
    add_header("#{@project.title} - Plataforma Booka")
    add_numeration
  end

  def index_page
    document_title @project.title
    text 'Índice', :size => 20
    move_down(10)
    @pages.each do |page|
      text page.title, :size => 15
      move_down 5
    end

  end

  def content_pages
    @pages.each do |page|
      start_new_page
      move_down(20)
      font "Tinos" do
        text page.title, :size => 30, :style => :bold_italic
      end
      @view.parse_body(page) do |name, node|
        case name
          when 'p'
            group do
              text node.inner_html, :indent_paragraphs => 0, :align => :justify, :inline_format => true
              move_down 5
            end
          when 'h2'
            move_down 20
            text node.content, :size => 20
        end
      end
    end
  end
end