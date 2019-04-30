class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end


  def create
    @user = current_user
    @profile = current_user.create_profile(profile_params)
    @profile.save


    redirect_to profile_path(@profile)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
  

  private
  def profile_params
    params.permit(:tutor?, :admin?, :name, :skills, :bio, :hourly_rate)
  end

end
