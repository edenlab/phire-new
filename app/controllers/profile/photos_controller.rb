module Profile
  class PhotosController < ApplicationController
    before_action :find_photo, only: [:show, :edit, :update, :destroy]

    def index
      @photos =  current_user.photos.all
    end

    def show
    end

    def new
      @photo = current_user.photos.new
    end

    def create
      @photo = current_user.photos.new(photo_params)
      if @photo.save
        redirect_to profile_photos_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      @photo.update(photo_params)
      if @photo.save
        redirect_to profile_photos_path
      else
        render :edit
      end
    end

    def destroy
      @photo.destroy
      redirect_to profile_photos_path
    end

    private

    def photo_params
      params.require(:photo).permit(:name, :specialty, :photo, :photo_cache)
    end

    def find_photo
      @photo = Photo.find(params[:id])
    end
  end
end
