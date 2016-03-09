class PhotosController < ApplicationController
  before_action :find_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      #redirection
    else
      render :new
    end
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    #redirection
  end

  def destroy
    @photo.destroy
    #redirection
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :specialty)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
