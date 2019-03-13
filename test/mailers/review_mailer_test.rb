class UserMailerPreview < ActionMailer::Preview

  def review_confirmation(review)
    review = Review.first
    ReviewMailer.welcome(review)
  end
end
