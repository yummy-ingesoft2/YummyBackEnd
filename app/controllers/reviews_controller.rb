class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :update, :destroy]
  def index
     products = Product.find(params[:product_id]) 
     review = products.reviews
      render json:review, status:200
end
def show
    products = Product.find(params[:product_id])
    reviews = products.reviews.find(params[:id])
	render json:reviews, status:201
end
  def create
    review = Review.new(review_params)

    if review.save
      render json: review, status: :created  
    else
      render json: review.errors, status: :unprocessable_entity
    end
end
def update
  if @reviews.update(review_params)
    render json: @reviews
  else
    render json: @reviews.errors, status: :unprocessable_entity
  end
end

# DELETE /zombies/1
def destroy
@reviews.destroy
end

def set_reviews
products = Product.find(params[:product_id])
  @reviews = products.reviews.find(params[:id])
end

  private

  def review_params
    params.require(:review).permit(:qualification, :content, :client_id, :product_id)
  end
end
