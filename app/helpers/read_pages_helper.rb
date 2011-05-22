module ReadPagesHelper
  def parse_body(page, &block)
    body = render_body(page, false)
    doc = Nokogiri::HTML(body)
    doc.traverse do |node|
      yield node.name, node
    end
  end
end
