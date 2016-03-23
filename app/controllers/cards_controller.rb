class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card_params = get_card_params
    @card = Card.create(@card_params)

    if @card.errors.empty?
      redirect_to @card
    else
      render "new"
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card_params = get_card_params
    @card = Card.find(params[:id])
    @card.update_attributes(@card_params)

    if @card.errors.empty?
      redirect_to @card
    else
      render "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  private
  def get_card_params
    @card_params = params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
