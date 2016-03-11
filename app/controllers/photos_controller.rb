class PhotosController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @specialty = params[:specialty]
    @nearby_users = User.near(params[:location], 20)
    user_ids = @nearby_users.map(&:id)
    @photos = Photo.where(specialty: @specialty, user_id: user_ids)
  end
end
