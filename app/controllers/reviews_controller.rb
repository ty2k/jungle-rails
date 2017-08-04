class ReviewsController < ApplicationController
  before_action :set_review, only: :destroy
  before_action :require_login, only: [:create, :destroy]
  # before_action :create, only: :require_login
  # before_action :destroy, only: :require_login

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

  def destroy
    @review.destroy
    redirect_to :back
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      if !current_user
        redirect_to :login
      end
    end
end
