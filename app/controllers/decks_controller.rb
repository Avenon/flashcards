class DecksController < ApplicationController
  before_action :find_deck, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  def index
    @decks = current_user.decks
  end

  def show
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.create(get_deck_params)

    if @deck.save
      redirect_to decks_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @deck.update_attributes(get_deck_params)

    if @deck.errors.empty?
      redirect_to @deck
    else
      render "edit"
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path
  end

  def activate
    @decks = current_user.decks
    @decks.each do |deck|
      deck.update_attributes(active: false)
    end
    deck = Deck.find(params[:id])
    deck.active = true
    deck.save
    redirect_to decks_path
  end

  def deactivate
    @deck.active = false
    @deck.save
    redirect_to decks_path
  end

  private

  def get_deck_params
    params.require(:deck).permit(:description, :active, :user_id)
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end
end
