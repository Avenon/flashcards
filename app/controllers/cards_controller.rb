class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]
  before_action :check_deck, only: [:new, :create, :edit, :update]

  def index
    @cards = current_user.cards
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(get_card_params)

    if @card.save
      redirect_to cards_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @card.update_attributes(get_card_params)

    if @card.errors.empty?
      redirect_to @card
    else
      render "edit"
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def get_card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :user_id, :avatar, :deck_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def check_deck
    @decks = current_user.decks
  end
end
