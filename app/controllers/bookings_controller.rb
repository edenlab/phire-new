class BookingController < ApplicationController
  before_action :find_booking, only[:edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      #redirection
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    #redirection
  end

  def destroy

  end

  private

  def booking_params
  end

  def find_booking
  end

end
