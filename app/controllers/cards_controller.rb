class CardsController < ApplicationController

  def new
  end

  def create
  end

  def show
    @card = Card.find(parms[:id])
  end

  def edit
  end

  def update
  end

  def index
    @cards = Card.all
  end

  def destroy
  end

end
