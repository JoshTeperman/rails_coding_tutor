class ProfilesController < ApplicationController
  before_action :load_profile, only: [:update]
  load_and_authorize_resource

  before_action :is_tutor?, only: :show
  skip_before_action :has_profile?, only: [:new, :create]

  def index
    admins = Profile.joins(:user).where(users: {admin?: true})
    moderators = Profile.joins(:user).where(users: {moderator?: true})
    @profiles = Profile.all.reject {|profile| admins.include?(profile) || moderators.include?(profile) }
  end

  def new
    @profile = Profile.new
    # raise
  end

  def create
    @user = current_user
    @profile = current_user.create_profile(profile_params)

    if @profile.save
      flash[:success] = "Profile saved"
      redirect_to profile_path(@profile)
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @tutor = User.find_by(id: @profile.user_id)
  end

  def my_students
    tutor_id = current_user.profile.tutor_id
    my_bookings = Booking.where(tutor_id: tutor_id)
    @my_students = my_bookings.map {|booking| booking.users.each{|student| student}}.flatten.uniq
    # raise
    # @my_students = User.all.select do |user|
    #   current_user.bookings.map do |booking|
    #     booking.users.include?(User.find(user.id))
    #   end
    # end

    # @my_students = User.all.select{|student| student.bookings.include?(Booking.where(tutor_id: current_user.profile.tutor_id))}
    # raise
  end


  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    # raise
    @user = current_user
    @profile = @user.profile
    if @profile
      @profile.update(profile_params)
      flash[:success] = 'Successfully updated'
      redirect_to @profile
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    redirect_to index_path
  end

  private
  def profile_params
    params.permit(:tutor?, :admin?, :first_name, :surname, :skills, :bio, :hourly_rate, :avatar)
  end

  def is_tutor?
    profile = Profile.find(params[:id])
    unless profile.tutor? || profile.user_id == current_user.id
      redirect_to index_path
      flash[:error] = 'Sorry, you can only view Tutor profiles'
    end
  end

  def load_profile
    @user = current_user
    @profile = current_user.profile
  end


end
