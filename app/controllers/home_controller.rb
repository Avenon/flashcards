class HomeController < ApplicationController
  def index
    active_deck = current_user.decks.find_active_deck

    if active_deck.empty?
      @card = current_user.cards.find_random_card
    else
      @card = current_user.cards.where('deck_id = ?', active_deck).find_random_card
    end
  end

  def check_card
    @card = current_user.cards.find(get_home_params[:id])
    result = @card.check_translate(get_home_params[:usertext])
    @card.increase_review_date
    flash[:notice] =
      if result
        "Успех! Перевод верен"
      else
        "Ошибка! Перевод ошибочный"
      end

    redirect_to root_path
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
