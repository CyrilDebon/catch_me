class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save

    if !@review.save
      redirect_to root_path, notice: "Quelque chose s'est mal passé, Merci de rééssayer"
    else
      redirect_to root_path, notice: "Message reçu, merci de l'intérêt porté à Catch Me !"
    end
  end

  def index
    @reviews = Review.all
  end

private

  def review_params
    params.require(:review).permit(:body, :amelioration, :like, :frenquencies, :recommendation)
  end


end
