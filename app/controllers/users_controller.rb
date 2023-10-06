class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  def show
    @books = Book.where(user_id: params[:id])
  end

  def edit
  end
end
