class PhotosController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @specialty = params[:specialty]
    @nearby_users = User.near(params[:location], 20)
    @photos = []
    @nearby_users.each do |user|
      @photos << user.photos.select{ |photo| photo.specialty == @specialty }
    @photos.flatten!
    end
  end
end
