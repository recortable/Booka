# encoding: utf-8
class ApplicationPdf < Prawn::Document
  BLUE = '29256a'

  def initialize
    super page_layout: :portrait, margin: [80, 50]
    setup_fonts
  end
  
  

  def document_title(title)
    move_down(30)
    font "Tinos" do
      text title, :size => 30, :style => :bold_italic
    end
  end

  def section_title(title)
    move_down(30)
    font "Tinos" do
      text title, :size => 25, :style => :bold_italic
    end
    move_down(30)
  end

  def add_numeration
    number_pages "Página <page> de <total>", :at => [bounds.right - 100, -30],
                 :width => 150, :page_filter => :all
  end

  def add_header(header)
    repeat :all do
      fill_color 'a0a1b5'
      draw_text "#{header}", :at => [bounds.left, bounds.top + 30]
    end
  end
  

  def setup_fonts
    font_families.update(
        "Tinos" => {:bold => "#{Rails.root}/fonts/Tinos-Bold.ttf",
                    :italic => "#{Rails.root}/fonts/Tinos-Italic.ttf",
                    :bold_italic => "#{Rails.root}/fonts/Tinos-BoldItalic.ttf",
                    :normal => "#{Rails.root}/fonts/Tinos-Regular.ttf"},
        "PT_Sans" => {:bold => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Bold.ttf",
                      :italic => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf",
                      :bold_italic => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf",
                      :normal => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf"}
    )
    font "PT_Sans"
    fill_color BLUE
  end


end

