class UsersController < ApplicationController
  def index
  end

  def show
    @books = Book.where(user_id: current_user.id)
  end

  def edit
  end
end
