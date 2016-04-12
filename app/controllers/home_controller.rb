class HomeController < ApplicationController
  def index
    active_deck = current_user.decks.find_active_deck

    if active_deck.nil?
      @card = current_user.cards.find_random_card
    else
      # Берем карту из активной колоды
      @card = current_user.cards.find_random_card.where(deck_id: active_deck.id)
    end
  end

  def check_card
    @card = current_user.cards.find(get_home_params[:id])
    result = @card.check_translate(get_home_params[:usertext])
    @card.increase_review_date(result)
    flash[:notice] =
      if result == 0
        "Успех! Перевод верен"
      elsif result > 1
        "Ошибка! Перевод ошибочный"
      elsif result == 1
        "Возможно у вас опечатка. Ваш вариант: #{get_home_params[:usertext]} Оригинал: #{@card.original_text}"
      end
    redirect_to root_path
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
