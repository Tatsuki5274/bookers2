class BooksController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save()
    redirect_to root_path()
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
