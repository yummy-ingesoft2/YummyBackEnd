class ReviewsController < ApplicationController
  def index
    #if 
      products = Product.find(params[:product_id])
      review = products.reviews
      render json:review, status:200
   # else
    #  clients = Client.find(params[:client_id])
    #  review = clients.reviews
    #  render json:review, status:200
    #end
end
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to [@review.reviewable], notice: 'Comment created'
    else
      render :new
    end
end

  private

  def review_params
    params.require(:review).permit(:qualification, :content, :reviewable_id, :reviewable_type)
  end
end
