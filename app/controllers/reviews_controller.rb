class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :destroy]

  def create
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new(review_params)

    @review.user = current_user

    if @review.save
      redirect_to @product, notice: 'Review was created successfully.'
    else
      redirect_to @product, notice: 'Review failed to save.'
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
