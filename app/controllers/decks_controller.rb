class DecksController < ApplicationController
  before_action :find_deck, only: [:show, :edit, :update, :destroy, :activate, :deactivate]
  before_action :change_status_to_false, only: [:activate]
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
    @deck.update(active: true)
    redirect_to decks_path
  end

  def deactivate
    @deck.update(active: false)
    redirect_to decks_path
  end

  private

  def get_deck_params
    params.require(:deck).permit(:description, :active, :user_id)
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end

  def change_status_to_false
    active_deck = current_user.decks.find_active_deck
    active_deck.update(active: false) unless active_deck.nil?
  end
end
