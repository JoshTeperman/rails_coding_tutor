class ReviewsController < ApplicationController
  # before_action :require_profile

  def index
    @user = current_user
    @reviews = @user.reviews
  end

  def create
    unless current_user.nil?
      @tutor = User.joins(:profile).where(profiles: { tutor_id: params[:tutor_id] }).first
      @review = @tutor.reviews.create(review_params)
      if @review.save
        redirect_to profile_path(@tutor.profile)
      else
        render new_review_path(@tutor)
      end
    end
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    tutor = User.find_by(id: @review.user_id)
    if @review.update(review_params)
      flash[:success] = 'Successfully updated'
      redirect_to profile_path(tutor.profile)
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    tutor = User.find_by(id: review.user_id)
    review.destroy

    redirect_to profile_path(tutor.profile)
  end

  private
    def review_params
      params.permit(:content, :rating, :reviewer_id)
    end
end
