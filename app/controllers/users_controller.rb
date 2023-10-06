class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!


  def index
    @users = User.all()
  end

  def show
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id != current_user.id then
      redirect_to root_path()
    end

    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "error"
      render "edit"
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
