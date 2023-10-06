class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!

  def is_matching_login_user
    book = Book.find(params[:id])
    if book.user_id != current_user.id
        redirect_to root_path()
    end
  end

  def index
    @books = Book.all()
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save()
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      flash[:alert] = "error"
      flash[:errors] = book.errors
      redirect_to books_path()
    end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
        flash.now[:alert] = "error"
        render "edit"
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy()
    redirect_to books_path()
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
