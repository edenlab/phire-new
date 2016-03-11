class ProfilesController < ApplicationController
  # before_action :set_profile, only: [:index, :show, :edit, :update, :destroy]

  # def index
  # end

  def show
    @profile = current_user
    @bookings = current_user.bookings
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render action: 'new'
  #   end
  # end

  def edit
    @profile
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to users_path
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :photo, :photo_cache)
  end
end

