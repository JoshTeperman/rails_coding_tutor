class ProfilesController < ApplicationController
  
  def home
  end

  def index
    admins = Profile.joins(:user).where(users: {admin?: true})
    moderators = Profile.joins(:user).where(users: {moderator?: true})
    @profiles = Profile.all.reject {|profile| admins.include?(profile) || moderators.include?(profile) }
  end

  def about
  end

  def new
    @profile = Profile.new
    # raise
  end

  def create
    @user = current_user
    @profile = current_user.create_profile(profile_params)
    # @profile = Profile.new(profile_params)
    # @profile.user_id = current_user.id

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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
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


end
