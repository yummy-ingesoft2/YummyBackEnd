class ReviewsController < ApplicationController
  before_action :authenticate_client, only: [:create,:show]
  before_action :set_reviews, only: [:show, :update, :destroy]
  def index
    #products = Product.find(params[:product_id]) 
    #review = products.reviews
    @reviews = Review.get_reviews_info(params[:product_id], params[:page])
    render json: @reviews, status:200
  end
  def show
    #products = Product.find(params[:product_id])
    #reviews = products.reviews.find(params[:id])
	  review = Review.get_review(params[:product_id], params[:id])
  	render json:review, status:201
  end
  def create
    if current_client
    products = Product.find(params[:product_id])
    review = products.reviews.new(review_params)
    review.client_id = current_client.id
    if review.save
      render json: review, status: :created  
    else
      render json: review.errors, status: :unprocessable_entity
    end
  else
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
    params.require(:review).permit(:qualification, :content, :product_id, :client_id)
  end
end
