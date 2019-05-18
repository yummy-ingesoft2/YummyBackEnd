class ReviewsController < ApplicationController
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
