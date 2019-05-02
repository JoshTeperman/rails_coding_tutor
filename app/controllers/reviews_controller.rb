class ReviewsController < ApplicationController

  def index
    @user = current_user
    @reviews = @user.reviews
    
  end

  def create
    unless current_user.nil?
      @reviewer_id = current_user.id
      @tutor = User.find(params[:tutor_id])
      @review = @tutor.reviews.create(review_params)
      if @review.save
        redirect_to profile_path(@tutor)
      else
        render new_review_path(@tutor)
      end
    end
  end

  def new

    @review = Review.new
    # raise

  end


  def show
   @user = current_user
    @review = @user.reviews
    
  end

  def edit

    @user = User.find(current_user.id)
  end
  
  def update

    @user = current_user
    
    @review = @user.reviews
    if @review
        @review.update(review_params)
        flash[:success] = "Successfully updated"
        redirect_to show_review_path
    else
      flash[:error] = "Error"
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(6)
    # tutor = User.find(params[:id])
    # @profile = tutor.profile

    id = params[:id]
    @review = Review.find(id)
    @review.destroy

    redirect_to profile_path(@profile)
  end

  private
  def review_params
    params.permit(:content, :rating, :reviewer)
  end


end
