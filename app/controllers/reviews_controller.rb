class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :destroy]
  before_action :create, only: :require_login

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

    def require_login
      unless current_user?
        flash[:error] = "You must be logged in to access this section"
        redirect_to @product # halts request cycle
      end
    end
end
