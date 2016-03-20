class CardscontrollerController < ApplicationController

  def index
    @cards = Card.all
  end
  
  def show
    @card = Card.find(parms[:id])
  end
  
end
