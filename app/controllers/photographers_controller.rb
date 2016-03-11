class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @photographer = User.find(params[:id])
  end
end