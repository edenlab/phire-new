module Profile
  class GigsController < ApplicationController
before action to find_gig


    def index
        @gigs = current_user.gigs
    end

    def decline
    end

    def accept
      @accepted = @current_gig.update(status: "accept") #voir enumerize pour le nom du status
      #redirection
    end

    def decline
      @decline = @current_gig.update(status: "decline") #voir enumerize pour le nom du status
      #same same
    end

  private

  def find_gig
    @current_gig = current_user.gigs.find(params[:id])
  end

  end
end
