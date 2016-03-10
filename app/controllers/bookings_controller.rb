class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    photographer_id = params["photographer_id"].to_i
    @booking.photographer = User.find(photographer_id)
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :message)
  end

end
