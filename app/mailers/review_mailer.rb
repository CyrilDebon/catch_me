class ReviewMailer < ApplicationMailer

  def welcome(review)
    @review = review

    mail(to: "catchmebordeaux@gmail.com", subject: "Nouvel avis sur l'app")
  end
end
