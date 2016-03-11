module Profile
  class GigsController < ApplicationController
    before_action :find_gig, only: [:accept, :decline]

    def index
    end

    def accept
      @accepted = @current_gig.update(status: "accepted") #voir enumerize pour le nom du status
      redirect_to profile_path
    end

    def decline
      @decline = @current_gig.update(status: "declined") #voir enumerize pour le nom du status
      redirect_to profile_path
    end

    private

    def find_gig
      @current_gig = current_user.gigs.find(params[:id])
    end
  end
end
