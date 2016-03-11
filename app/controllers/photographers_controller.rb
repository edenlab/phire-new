class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @photographer = User.find(params[:id])
    redirect_to root_path if @photographer.photographer == false
  end
end