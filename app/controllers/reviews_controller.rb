class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @reviews = User.reviews
  end

  def create
    unless current_user.nil?
      @user = User.find(params[:id])
      @review = User.reviews.create(review_params)
      if @review.save
        redirect_to user_path(@user)
      else
        render new_review_path
      end
    end
  end

  def new
    @review = Review.new
  end


  def show
    @review = find_review(params)
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private
  def review_params
    params.permit()
  end

  def find_review
    Review.find(params[:id])
  end


end
