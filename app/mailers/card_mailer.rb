class CardMailer < ApplicationMailer
  default from: "from@example.com"

  def send_expired_cards(email)
    @email = email
    @cards = Card.where('review_date<?', Time.now)
    mail(to: @email, subject: "У вас есть непроверенные карточки")
  end
end
