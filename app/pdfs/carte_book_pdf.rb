# encoding: utf-8
class CarteBookPdf < ApplicationPdf
  # @param carte_book [CarteBook]
  def initialize(carte_book, view)
    super()
    @carte_book = carte_book
    @view = view
    cover_page
    index_page
    contents
    add_header("#{@carte_book.title} / #{@carte_book.editor}")
    add_numeration
  end

  def cover_page
    document_title @carte_book.title
    text @carte_book.subtitle, size: 20, style: :italic
    #text '(La funcionalidad de generación de PDF esta en desarrollo)'
  end

  def index_page
    start_new_page
    document_title 'Índice'
    @carte_book.index.each do |indice|
      text indice[:title], size: 15
      move_down 5
    end
  end

  def contents
    @carte_book.index.each do |indice|
      start_new_page
      section_title indice[:title]
    end
  end
end