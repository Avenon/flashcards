class HomeController < ApplicationController
  def index
    array = Card.where('review_date <= ?', Time.now).map { |i| i.id }
    card_id = array[rand(array.size)]
    @card = Card.find(card_id)
  end
end
