class HomeController < ApplicationController
  def index
    array = Array.new
    array = Card.all.map { |i| i.id}
    card_id = array[rand(array.size)]
    @card = Card.find(card_id)
  end
end
