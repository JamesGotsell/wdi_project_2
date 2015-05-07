class ReviewsController < ApplicationController

  def create
    @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
    @review = current_user
    @review = @coffeeshop.reviews.create(review_params)
    if !current_user.nil?s
      @review.user_id = current_user.id
    end
    if @review.save
      redirect_to @coffeeshop,
        notice: 'Review was successfully added.'
    else redirect_to @coffeeshop,
        notice: 'Error creating review!'
    end
  end



  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :user_id)
  end
end