class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    # associate the review with the restaurant
    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant
    else
      render @restaurant
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.restaurant
    else
      render :new
    end
  end

  def destroy
    @review.delete

    redirect_to @review.restaurant
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
