class BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def create
    @user = current_user
    @tutor = params['tutor_id'] # available: profile.tutor_id
    # @tutor_profile = Profile.find_by(tutor_id: @booking.tutor_id)
    @booking = @user.bookings.create(booking_params)
    if @booking.save
      flash[:success] = "Created a new booking."
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Error: Could not create booking."
      redirect_to :back
    end

  end

  def new
    @tutor_id = params[:tutor]
    @tutor_first_name = Profile.find_by(tutor_id: @tutor_id).first_name
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
    @tutor_profile = Profile.find_by(tutor_id: @booking.tutor_id)
    if @booking.update(booking_params)
      flash[:success] = "You updated your booking with #{@tutor_profile.first_name}."
      redirect_to @booking
    else
      flash[:error] = "Error"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @bookings = @user.bookings
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:success] = "Booking Deleted."
      redirect_to bookings_path
    else
      flash[:error] = "Error: Could not delete booking."
    end
  end


  private
  def booking_params
    params.permit(:date, :location, :price, :duration, :tutor_id)
  end


end


