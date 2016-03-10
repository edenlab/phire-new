module Profile
  class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :update, :destroy]

  def index
      @bookings = Booking.all
    end

  def edit
    end

    def update
      @booking.update(booking_params)
      redirect_to profile_path
    end

    def destroy
      @booking.destroy
      redirect_to profile_path
    end

  private

    def booking_params
      params.require(:booking).permit(:date, :status, :message)
    end

    def find_booking
      @booking = Booking.find(params[:id])
    end

  end
end
