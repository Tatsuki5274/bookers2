class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save()
      redirect_to book_path(book.id)
    else
      flash[:errors] = book.errors
      redirect_to books_path()
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
