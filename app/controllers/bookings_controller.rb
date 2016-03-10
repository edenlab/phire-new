class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

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

  def edit
  end

  def update
    @booking.update(booking_params)
    # redirect_to current_user_path
  end

  def destroy
    @booking.destroy
    #redirection
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :message)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
