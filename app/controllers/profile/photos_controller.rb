module Profile
  class PhotosController < ApplicationController
    def index
      @photos =  Photo.all
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
      params.require(:photo).permit(:name, :specialty)
    end

    def find_photo
      @photo = Photo.find(params[:id])
    end
  end
end
