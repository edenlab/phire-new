class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @users = user.all
  end

  def show
  end

  def new
    @cocktail = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render action: 'new'
    end
  end

  def edit
    @user = user.find(params[:id])
  end

  def update
    if @user.update(cocktail_params)
      redirect_to user_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = user.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :photo, :photo_cache)
  end
end
end
