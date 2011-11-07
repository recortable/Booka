class Alacarte::CarteBooksController < Alacarte::ApplicationController
  before_filter :require_user

  expose(:booka_line) { BookaLine.find 3 }
  expose(:new_line_comment) { Comment.new(:resource => booka_line) }
  expose(:carte_books) { CarteBook.scoped }
  expose(:carte_book)

  def index

  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CarteBookPdf.new(carte_book, view_context)
        send_data pdf.render, filename: "#{carte_book.title}.pdf",
                  type: "application/pdf", disposition: "inline"
      end
    end

  end

  def new

  end

  def edit

  end

  # Edit content
  def content

  end

  def create
    carte_book.user = current_user
    flash[:notice] = 'Libro a la carta creado.' if carte_book.save
    respond_with carte_book, location: [:content, :alacarte, carte_book]
  end

  def update
    flash[:notice] = 'Libro actualizado.' if carte_book.update_attributes(params[:carte_book])
    respond_with carte_book, location: [:alacarte, carte_book]
  end

end
