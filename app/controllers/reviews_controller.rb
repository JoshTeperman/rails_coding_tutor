class ReviewsController < ApplicationController

  def index
  end

  def create

  end

  def new
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
