pdf.font_families.update(
    "Tinos" => {:bold => "#{Rails.root}/fonts/Tinos-Bold.ttf",
                :italic => "#{Rails.root}/fonts/Tinos-Italic.ttf",
                :bold_italic => "#{Rails.root}/fonts/Tinos-BoldItalic.ttf",
                :normal => "#{Rails.root}/fonts/Tinos-Regular.ttf"},
    "PT_Sans" => {:bold => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Bold.ttf",
                  :italic => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf",
                  :bold_italic => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf",
                  :normal => "#{Rails.root}/fonts/PT_Sans-Narrow-Web-Regular.ttf"}
)
pdf.font "PT_Sans"

pdf.fill_color '29256a'
pdf.move_down(30)
pdf.font "Tinos" do
  pdf.text project.title, :size => 30, :style => :bold_italic
end

pdf.move_down(30)
pdf.text 'Índice', :size => 20
pdf.move_down(10)
pages.each do |page|
  pdf.text page.title, :size => 15
  pdf.move_down 5
end

pages.each do |page|
  pdf.start_new_page
  pdf.move_down(20)
  pdf.font "Tinos" do
    pdf.text page.title, :size => 30, :style => :bold_italic
  end
  parse_body(page) do |name, node|
    case name
      when 'p'
        pdf.group do
          pdf.text node.inner_html, :indent_paragraphs => 0, :align => :justify, :inline_format => true
          pdf.move_down 5
        end
      when 'h2'
        pdf.move_down 20
        pdf.text node.content, :size => 20
    end
  end
end

pdf.repeat :all do
  pdf.fill_color 'a0a1b5'
  pdf.draw_text "#{project.title} - Plataforma Booka", :at => [pdf.bounds.left, pdf.bounds.top + 30]
end

pdf.number_pages "Página <page> de <total>", :at => [pdf.bounds.right - 100, -30],
                 :width => 150,
                 :page_filter => :all

