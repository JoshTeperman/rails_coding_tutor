class ReviewsController < ApplicationController

  def index
    @user = current_user
    @reviews = @user.reviews
    
  end

  def create
    unless current_user.nil?
      @user = User.find(current_user.id)
      @review = @user.reviews.create(review_params)
      if @review.save
        redirect_to home_path
      else
        render new_review_path
      end
    end
  end

  def new
    @review = Review.new
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
    @user = User.find(current_user.id)
    @user.review.destroy
   
    redirect_to home_path
  end

  private
  def review_params
    params.permit(:content, :rating, :reviewer)
  end


end
