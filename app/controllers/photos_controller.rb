class PhotosController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @query = params[:query]
    @photos = Photo.all
  end

end
