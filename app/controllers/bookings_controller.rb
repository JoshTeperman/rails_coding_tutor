class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    booking = Booking.new(booking_params)
    booking.save

    redirect_to booking_path
  end

  def new
    @booking = Booking.new
  end


  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end
  
  def update
    
    @booking = Booking.find(params[:id])
      if  @booking.update(booking_params)
        flash[:success] = "Successfully updated"
        redirect_to @booking
    else
      flash[:error] = "Error"
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
   
    redirect_to booking_path
  end


  private
  def booking_params
    params.permit(:date, :location, :price, :duration)
  end


end


