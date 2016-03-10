module Profile
  class BookingsController < ApplicationController
    before_action :find_booking, only: [:edit, :update, :destroy]

  def index
      @bookings = current_user.bookings
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
      @booking = current_user.bookings.find(params[:id])
    end

  end
end
