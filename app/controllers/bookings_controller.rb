class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    booking = Booking.new(booking_params)
    booking.save

    redirect_to home_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.permit(:date, :location, :price, :duration)
  end


end