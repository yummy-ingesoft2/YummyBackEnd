class ReviewsController < ApplicationController
  before_action :authenticate_client, only: [:index,:create,:show]
  before_action :authenticate_cook, only: [:index,:show]
  before_action :set_reviews, only: [:show, :update, :destroy]
  before_action :authenticate_admin, only: [:all]
  def index
    #products = Product.find(params[:product_id]) 
    #review = products.reviews
    @reviews = Review.get_reviews_info(params[:product_id], params[:page])
    render json: @reviews, status:200
  end
  def all
    @reviews = Review.all
    render json: @reviews, status:200
  end
  def show
    products = Product.find(params[:product_id])
    @review = products.reviews.find(params[:id])
    respond_to do |format|
      format.html {render json: @review, status:201}
      format.json {render json: @review, status:201}
      format.pdf do 
        pdf = ReviewPdf.new(@review)
        send_data pdf.render, filename: "order_#{ @review.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
	  #@review = Review.get_review(params[:product_id], params[:id])
  end
  def create
    if current_client
    user = Cook.find(params[:cook_id])
    products = Product.find(params[:product_id])
    review = products.reviews.new(review_params)
    review.client_id = current_client.id
    if review.save
      NotificationMailer.new_comment(user,products,review).deliver_now
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
