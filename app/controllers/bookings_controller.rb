class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    booking = Booking.new(booking_params)
    booking.save

    redirect_to home_path
  end

  def new
  end


  def show
    @booking = find_booking(params)
  end


  def edit
  end
  
  def update
  end

  def destroy
  end

  private
  def booking_params
    params.permit(:date, :location, :price, :duration)
  end

  def find_booking
    Booking.find(params[:id])
  end

end


