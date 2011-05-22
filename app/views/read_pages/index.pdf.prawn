pdf.fill_color '29256a'
pdf.move_down(30)
pdf.text project.title, :size => 30, :style => :bold

pdf.move_down(30)

pages.each do |page|
  pdf.text page.title
end

pages.each do |page|
  pdf.start_new_page
  pdf.move_down(20)
  pdf.text page.title, :size => 20
  parse_body(page) do |name, node|
    case name
      when 'p'
        pdf.text node.inner_html, :indent_paragraphs => 0, :align => :justify, :inline_format => true
        pdf.move_down 5
      when 'h2'
        pdf.move_down 20
        pdf.text node.content, :size => 10
    end
  end
end

pdf.repeat :all do
  pdf.draw_text "Plataforma Booka", :at => [pdf.bounds.left, pdf.bounds.top + 30]
end

pdf.number_pages "Página <page> de <total>", :at => [pdf.bounds.right - 100, -30],
                 :width => 150,
                 :page_filter => :all

